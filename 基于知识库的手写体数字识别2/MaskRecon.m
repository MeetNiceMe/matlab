%ƥ��ʶ����
function result = MaskRecon(Data, v)
%����ģ��ʶ��
%�������
%Data����ģ�����
%v������������
%�������
%result����ʶ����
for i = 1 : size(Data, 1)
    dis(i) = norm(v-Data(i, :));
end
[mindis, ind] = min(dis);
if ind < 11
    result = ind-1;
else
    result = ind-11;
end