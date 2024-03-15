% 步骤1: 打开并读取二进制文件
fileID = fopen('1.bin', 'r'); % 打开文件用于读取
IQ1 = fread(fileID, 'float32'); % 读取数据为float32格式
fclose(fileID); % 关闭文件

% 分配空字符串数组用于存储解码后的文本
decodedTexts = strings(2000, 1);

for j = 1:2000
    % 由于我们不知道每个句子对应的IQ数据长度，这里假设它们是等长的
    % 步骤2: 分离I和Q信号
    I1 = IQ1(1:2:end); % 提取偶数位置的值作为I信号
    Q1 = IQ1(2:2:end); % 提取奇数位置的值作为Q信号

    % 解调BPSK信号
    I2 = I1 <= 0;

    % 步骤3: 将解调后的二进制序列转换回ASCII码
    decodedText = ''; % 初始化变量来存储解码后的文本
    for i = 1:8:length(I2)
        % 提取当前字节的二进制序列
        currentByte = I2(i:i+7);
        % 将二进制数组转换为二进制字符串
        byteString = num2str(currentByte');
        byteString(byteString == ' ') = ''; % 清除空格
        % 将二进制字符串转换为十进制数值
        byteValue = bin2dec(byteString);
        % 将十进制数值转换为对应的ASCII字符
        decodedText = [decodedText, char(byteValue)];
    end

    decodedTexts(j) = decodedText;

    % 更新IQ1以去除已解码的部分
    IQ1(1:(length(I1) + length(Q1))) = [];
end

% 将解码后的文本内容写入到文件
fileID = fopen('decodedTexts.txt', 'w');
if fileID == -1
    error('文件无法打开');
end
for j = 1:length(decodedTexts)
    fprintf(fileID, '%s\n', decodedTexts(j));
end
fclose(fileID);

%--------------------------------------------------------------------------
% 打开文件
fid = fopen('decodedTexts.txt', 'r');

% 初始化一个空的字符串数组来存储文件内容
content = [];

% 逐行读取文件
while ~feof(fid)
    % 读取一行
    line = fgetl(fid);
    
    % 将这一行中的'. '替换为'. \n'
    line = strrep(line, '. ', '. \n');
    
    % 将这一行添加到文件内容数组中
    content = [content, line];
end

% 关闭文件
fclose(fid);

% 将文件内容数组转换为字符串
content = char(content);


% 步骤1: 打开并读取原始文件
filename = 'decodedTexts.txt';
fileID = fopen(filename, 'r');
if fileID == -1
    error('文件无法打开');
end
% 读取文件内容到一个字符串中
fileContent = fread(fileID, '*char')';
fclose(fileID);

% 步骤2: 按句点分割文本到一个单元数组中
sentences = strsplit(fileContent, '.');

% 步骤3: 将每个句子写入新文件的一行中，忽略空句子
newFilename = 'reformattedTexts.txt';
newFileID = fopen(newFilename, 'w');
if newFileID == -1
    error('新文件无法创建');
end

for i = 1:length(sentences)
    trimmedSentence = strtrim(sentences{i}); % 去除句子两端的空白字符
    if ~isempty(trimmedSentence)
        if i < length(sentences)
            % 对于非最后一个句子，添加标点和换行符
            fprintf(newFileID, '%s.\n', trimmedSentence);
        else
            % 对于最后一个句子，仅添加标点，不添加换行符
            fprintf(newFileID, trimmedSentence);
        end
    end
end

fclose(newFileID);



% 步骤1: 打开并读取原始文件
filename = 'reformattedTexts.txt';
fileID = fopen(filename, 'r');
if fileID == -1
    error('文件无法打开');
end
% 读取文件内容到一个字符串中
fileContent = fread(fileID, '*char')';
fclose(fileID);

% 步骤2: 按句点分割文本到一个单元数组中
sentences = strsplit(fileContent, '?');

% 步骤3: 将每个句子写入新文件的一行中，忽略空句子
newFilename = '2.txt';
newFileID = fopen(newFilename, 'w');
if newFileID == -1
    error('新文件无法创建');
end

for i = 1:length(sentences)
    trimmedSentence = strtrim(sentences{i}); % 去除句子两端的空白字符
    if ~isempty(trimmedSentence)
        if i < length(sentences)
            % 对于非最后一个句子，添加标点和换行符
            fprintf(newFileID, '%s?\n', trimmedSentence);
        else
            % 对于最后一个句子，仅添加标点，不添加换行符
            fprintf(newFileID, trimmedSentence);
        end
    end
end

fclose(newFileID);


% 步骤1: 打开并读取原始文件
filename = '2.txt';
fileID = fopen(filename, 'r');
if fileID == -1
    error('文件无法打开');
end
% 读取文件内容到一个字符串中
fileContent = fread(fileID, '*char')';
fclose(fileID);

% 步骤2: 按句点分割文本到一个单元数组中
sentences = strsplit(fileContent, '!');

% 步骤3: 将每个句子写入新文件的一行中，忽略空句子
newFilename = '3.txt';
newFileID = fopen(newFilename, 'w');
if newFileID == -1
    error('新文件无法创建');
end

for i = 1:length(sentences)
    trimmedSentence = strtrim(sentences{i}); % 去除句子两端的空白字符
    if ~isempty(trimmedSentence)
        if i < length(sentences)
            % 对于非最后一个句子，添加标点和换行符
            fprintf(newFileID, '%s!\n', trimmedSentence);
        else
            % 对于最后一个句子，仅添加标点，不添加换行符
            fprintf(newFileID, trimmedSentence);
        end
    end
end

fclose(newFileID);

% 定义文件名
filename = '2.txt';

% 检查文件是否存在
if exist(filename, 'file')
    % 如果文件存在，则删除文件
    delete(filename);
    disp(['文件 ', filename, ' 已被删除。']);
else
    % 如果文件不存在，显示消息
    disp(['文件 ', filename, ' 不存在，无法删除。']);
end

% 定义文件名
filename = 'reformattedTexts.txt';

% 检查文件是否存在
if exist(filename, 'file')
    % 如果文件存在，则删除文件
    delete(filename);
    disp(['文件 ', filename, ' 已被删除。']);
else
    % 如果文件不存在，显示消息
    disp(['文件 ', filename, ' 不存在，无法删除。']);
end