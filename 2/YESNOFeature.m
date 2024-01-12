fs = 44100;

RecObj = audiorecorder(fs, 16, 2);
disp('Start speaking.')
recordblocking(RecObj, 2);
disp('End of Recording.');

x = getaudiodata(RecObj);
yes_no(x,fs)


