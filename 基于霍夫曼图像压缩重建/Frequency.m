function f = Frequency(vector)
if ~isa(vector,'uint8')
    error('Ӧ������uint8��������������');
end
f = histc(vector(:), 0:255); 
f = f(:)'/sum(f); 