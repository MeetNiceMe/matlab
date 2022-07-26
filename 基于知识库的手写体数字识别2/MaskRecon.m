%匹配识别函数
function result = MaskRecon(Data, v)
%基于模板识别
%输入参数
%Data——模板矩阵
%v——特征向量
%输出参数
%result——识别结果
for i = 1 : size(Data, 1)
    dis(i) = norm(v-Data(i, :));
end
[mindis, ind] = min(dis);
if ind < 11
    result = ind-1;
else
    result = ind-11;
end