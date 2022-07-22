function fileList = get_all_files(dirName)
% ��ȡ�ļ���Ϣ
dirData = dir(dirName);
% ��ȡ������Ϣ
dirIndex = [dirData.isdir];
% ��ȡ�ļ��б�
fileList = {dirData(~dirIndex).name}';
if ~isempty(fileList)
    % ����ǿգ������ļ�·�����б�
    fileList = cellfun(@(x) fullfile(dirName,x),...
        fileList,'UniformOutput',false);
end
% ��ȡ���ļ��б�
subDirs = {dirData(dirIndex).name};
% ������Ч·��
validIndex = ~ismember(subDirs,{'.','..'});
%#   that are not '.' or '..'
for iDir = find(validIndex)
    % ��ȡ�ļ�����Ϣ
    nextDir = fullfile(dirName,subDirs{iDir});
    % ��ȡ�ļ��б�
    fileList = [fileList; get_all_files(nextDir)];
end