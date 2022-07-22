function fileList = get_all_files(dirName)
% 获取文件信息
dirData = dir(dirName);
% 获取索引信息
dirIndex = [dirData.isdir];
% 获取文件列表
fileList = {dirData(~dirIndex).name}';
if ~isempty(fileList)
    % 如果非空，整合文件路径到列表
    fileList = cellfun(@(x) fullfile(dirName,x),...
        fileList,'UniformOutput',false);
end
% 获取子文件列表
subDirs = {dirData(dirIndex).name};
% 过滤无效路径
validIndex = ~ismember(subDirs,{'.','..'});
%#   that are not '.' or '..'
for iDir = find(validIndex)
    % 获取文件夹信息
    nextDir = fullfile(dirName,subDirs{iDir});
    % 获取文件列表
    fileList = [fileList; get_all_files(nextDir)];
end