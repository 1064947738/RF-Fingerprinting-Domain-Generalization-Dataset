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