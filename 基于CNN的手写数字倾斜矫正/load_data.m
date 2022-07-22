function [XTrain, YTrain, XValidation, YValidation] = load_data()
if exist(fullfile(pwd, 'db/db.mat'))
    load(fullfile(pwd, 'db/db.mat'));
    return;
end
fid = fopen(fullfile(pwd, 'db/train.txt'));
train = textscan(fid,'%s %d %d');
fclose(fid);
fid = fopen(fullfile(pwd, 'db/test.txt'));
test = textscan(fid,'%s %d %d');
fclose(fid);
XTrain = [];
YTrain = [];
for i = 1 : length(train{1})
    filei = fullfile(pwd, 'db', sprintf('%d/%s', train{2}(i), train{1}{i}));
    x = imread(filei);
    y = train{3}(i);
    XTrain(:,:,:,i) = x;
    YTrain(i, 1) = y;
end
XValidation = [];
YValidation = [];
for i = 1 : length(test{1})
    filei = fullfile(pwd, 'db', sprintf('%d/%s', test{2}(i), test{1}{i}));
    x = imread(filei);
    y = test{3}(i);
    XValidation(:,:,:,i) = x;
    YValidation(i, 1) = y;
end
save(fullfile(pwd, 'db/db.mat'), 'XTrain', 'YTrain', 'XValidation', 'YValidation');