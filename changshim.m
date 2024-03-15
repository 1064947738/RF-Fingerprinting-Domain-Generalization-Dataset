% 步骤1: 打开并读取文本文件
filename = '1.txt';
fileID = fopen(filename, 'r');
if fileID == -1
    error('文件无法打开');
end
sentences = textscan(fileID, '%s', 'Delimiter', '\n');
sentences = sentences{1};
fclose(fileID);

% 步骤2: 打开二进制文件用于写入
fileID_bin = fopen('1.bin', 'w');
if fileID_bin == -1
    error('二进制文件无法打开');
end

% 步骤3: 对每个句子进行BPSK调制并写入
for k = 1:length(sentences)
    sentence = sentences{k};
    
    % 将字符转换为ASCII码
    asciiValues = double(sentence);
    
    % 将ASCII值转换为二进制序列
    binarySequence = dec2bin(asciiValues, 8);
    binarySequence = reshape(binarySequence', 1, []);
    binarySequence = binarySequence - '0';
    
    % BPSK调制
    I = zeros(1, length(binarySequence));
    for i = 1:length(binarySequence)
        if binarySequence(i) == 0
            I(i) = 1;
        else
            I(i) = -1;
        end
    end
    Q = zeros(size(I));
    
    % 合并I和Q信号
    IQ = zeros(1, length(I) * 2);
    IQ(1:2:end) = I;
    IQ(2:2:end) = Q;
    
    % 写入二进制文件
    fwrite(fileID_bin, IQ, 'float32');
end

% 关闭二进制文件
fclose(fileID_bin);
