%% MatSynth by KalMa    #MatFunZone (2018)
%  contact: maciej.kalarus@gmail.com
%  ------------------------------------------------------------------------
%% Modified by Florian Mayer 
%  contact: florian.mayer@fh-joanneum.at

% use keyboard or mouse to play
% use mouse to change amplitude profile and shape of the waves

function MatSynthesizer

    close all
    clear all
    global Synth
    
    Name                    = 'TheFlowsSynth';
    Version                 = 1.0;
    
    %% Tones
    RefTone                 = 440;                                      % [Hz] - reference tone (A)
    ToneId                  = -9:27;                                    % with respect to reference tone (0-A) (e.g. [-2,-1,0,1] means [G G# A A#])
    ToneName                = {'C' 'C#' 'D' 'D#' 'E' 'F' 'F#' 'G' 'G#' 'A' 'A#' 'B'};
    Synth.Tones.Fs          = 16384;                                    % [Hz] - sampling frequency 
    Synth.Tones.Frequency   = RefTone * 2.^(ToneId/12);                 % table of frequencies [Hz]
    Synth.Keyboard          = {'z' 'x' 'd' 'c' 'f' 'v' 'b' 'h' 'n' 'j' 'm' 'k' 'comma' 'period' 'semicolon' 'slash'};   % defines keyboard (Matlab notation)
    KeyboardMarker          = {'z' 'x' 'd' 'c' 'f' 'v' 'b' 'h' 'n' 'j' 'm' 'k' ','     '.'      ';'         '/'};
    Synth.Tones.Sample      = cell(size(ToneId));
    Synth.T                 = 0.45;                                     % sound duration [s]

    %% Keys
    Key(1)                  = struct('X',[-0.5 0.5 0.5 -0.5], 'Y',[0 0 3 3], 'Color','white');
    Key(2)                  = struct('X',[-0.4 0.4 0.4 -0.4], 'Y',[1 1 3 3], 'Color','black');
    KeyName                 = ToneName(mod(ToneId+9,12)+1);
    KeyColorId              = cellfun(@(x) (length(x)==2)+1, KeyName);  % 1-white, 2-black
    Synth.KeyboardToneId    = (1-length(Synth.Keyboard):0) + find(strcmp(KeyName,'D'),1,'last');    % 'slash' = first D from the left side
                              
    %% Board
    KeyScale        = 40;                                               % change this value to resize Synth
    Size            = [sum(KeyColorId==1)+1, 3] * KeyScale + [0 60];    % depends on number of white keys
    Color           = [0 0.6 0.8];
    BackgroundColor = [1 1 1];

    %% Application window
    ScreenSize = get(0,'ScreenSize');
    figure( 'Units','pixels',...
            'Renderer','painters',...
            'Position',[(ScreenSize(3:4) - Size)*0.5, Size] + [0 0 10 27],...
            'MenuBar','none',...
            'NumberTitle','off',...
            'Resize','off',...
            'Color',BackgroundColor,...
            'Name',[Name, ' for ASP21'],...
            'KeyPressFcn',@(~,evt)KeyPress(evt.Key));
    
    axes( 'Units','pixels',...
          'Position',[5 5 Size],...
          'NextPlot','add',...
          'box','on',...
          'Color',Color,...
          'xlim',[0 Size(1)],...
          'ylim',[0 Size(2)],...
          'XTick',[],...
          'YTick',[]);
    
    title(sprintf('%s v%0.1f', Name, Version));

    %% Create keyboard
    nTone           = length(ToneId);
    KeyBoard(nTone) = matlab.graphics.primitive.Patch;
    X = KeyScale;
    for i = 1:nTone
        cid = KeyColorId(i);
        x = X + (Key(cid).X - (cid==2)*0.5)*KeyScale;
        y = 5 + Key(cid).Y*KeyScale;
        KeyBoard(i) = patch(x,y,Key(cid).Color,'ButtonDownFcn',@(~,~)MousePress(i));
        if (cid==1), uistack(KeyBoard(i),'bottom'); end;
        text(mean(x(1:2)),y(1)+12,KeyName{i},'Color',Key(3-cid).Color,'HorizontalAlignment','center','PickableParts','none');
        id = find(Synth.KeyboardToneId==i);
        if ~isempty(id)
            text(mean(x(1:2)),y(1)+30,KeyboardMarker{id},'Color',[0.5 0.5 0.5],'HorizontalAlignment','center','PickableParts','none');
        end
        X = X + (cid==1)*KeyScale;
    end
    
    text([120;120],Size(2)-[15;35],{'shape:','amplitude profile:'},'HorizontalAlignment','right','FontWeight','bold');
    Synth.hShape     = text((130:90:310)',ones(3,1)*(Size(2)-15),{'sinus','square','3 sin'},'ButtonDownFcn',@(src,~)ChangeShape(src));
    Synth.hAmplitude = text((130:90:220)',ones(2,1)*(Size(2)-35),{'constant','decending'},'ButtonDownFcn',@(src,~)ChangeAmplitude(src));

    %% Initial settings
    Synth.ToneShapeId       = 1;
    Synth.ToneAmplitudeId   = 1;
    CreateSamples();
end

function ChangeShape(src)
    global Synth
    Synth.ToneShapeId = find(Synth.hShape==src);
    CreateSamples();
end

function ChangeAmplitude(src)
    global Synth
    Synth.ToneAmplitudeId = find(Synth.hAmplitude==src);
    CreateSamples();
end

function CreateSamples()
    global Synth
    set([Synth.hShape; Synth.hAmplitude],'Color','black');
    set([Synth.hShape(Synth.ToneShapeId); Synth.hAmplitude(Synth.ToneAmplitudeId)],'Color','yellow');


    % amplitude
    switch Synth.ToneAmplitudeId
        case 1                                      % constant
            Amp = linspace(1,1,Synth.Tones.Fs*Synth.T);
        case 2                                      % decending
            Amp = linspace(1,0,Synth.Tones.Fs*Synth.T);
    end

    % shape
    %% Place your calculation for the time instances HERE

    for i=1:length(Synth.Tones.Sample)
        %% Place your omega calculation HERE

        switch Synth.ToneShapeId
            case 1                                  % sinus

            case 2                                  % square

            case 3                                  % 3 sin

        end
        %% Uncomment after adding sounds
        %Synth.Tones.Sample{i} = s.*Amp;
    end
end

function MousePress(ToneId)
    global Synth
    sound(Synth.Tones.Sample{ToneId}, Synth.Tones.Fs);
end

function KeyPress(key)
    global Synth
    id = find(ismember(Synth.Keyboard,key));
    if ~isempty(id)
        ToneId = Synth.KeyboardToneId(id);
        if (ToneId>0)
            sound(Synth.Tones.Sample{ToneId}, Synth.Tones.Fs);
        end
    end
end
