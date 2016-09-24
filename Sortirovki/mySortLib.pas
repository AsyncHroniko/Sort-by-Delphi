unit mySortLib;

interface
// ���������� ������� � ��������:
procedure InsertionSort(var arr: array of Integer);
procedure InsertionSortBisection(var arr: array of Integer);
procedure Sort(var arr: array of Integer; L, R: Integer); 
procedure QuickSort(var arr: array of Integer);
procedure QuickSortNonRecursive(var arr: array of Integer);
procedure SelectionSort(var arr: array of Integer);
procedure BubbleSort(var arr: array of Integer);
procedure ShakerSort(var arr: array of Integer);



implementation
// ---- ������ ���������� ---


// ��������� ���������� ������� ����� ����� ������ ����������
procedure InsertionSort(var arr: array of Integer);
var i,j: Integer;
    tmp : Integer; //   ��������� ���������� ��� �������� ��������������� ��������
    size : Integer; // ������ �������
begin
  size:= Length(arr); // ����� �������
  // ��������� ���������� �������:
  for i:=1 to size-1 do
  begin
    tmp:= arr[i];  // ����������� ������� �������
    arr[0]:= tmp; // ������������� �������� �� ������� �������
    j:= i; // ���������� �����
    while tmp < arr[j-1] do
    begin
      arr[j]:= arr[j-1];
      j:= j-1; // ��� � ������
    end;
    arr[j]:= tmp; // �������� ������� ������� �� ���������� �����

  end;
end;


// ��������� ���������� ������� ����� ����� ������ ���������� ����� ��������
procedure InsertionSortBisection(var arr: array of Integer);
var i, j : Integer;
    M, L, R : Integer;
    tmp : Integer;
    size : Integer; // ������ �������
begin
  size:= Length(arr); // ����� �������
  // ��������� ���������� �������������� �������:
  for i:= 1 to size-1 do
  begin
    tmp:= arr[i];
    L:= 1;
    R:= i;
    while L < R do
    begin
      M:= (L + R) div 2;
      if arr[M] <= tmp then L:= M + 1  // ����������� �������
      else R:= M;
    end;
    for j:= i downto R+1 do
    begin
      arr[j]:= arr[j-1];   // ����������� ��� �������� ������
    end;    
    arr[R]:= tmp; // ������������� �� ���������� ����� ������� �������
  end;
end;


// ������� ���������� � ���������:
procedure Sort(var arr: array of Integer; L, R: Integer);                   // var arr: array of Integer;
var i, j : Integer;
    x, w : Integer;
begin
  i:= L; j:= R;
  x:= arr[(L + R) div 2];
  repeat
    while arr[i] < x do i:= i + 1;
    while x < arr[j] do j := j - 1;
    if i <= j then
    begin
      w := arr[i]; arr[i]:= arr[j]; arr[j]:= w; i:= i + 1; j:= j - 1;
    end;
  until i > j;
  if L < j then Sort(arr, L, j);
  if i < R then Sort(arr, i, R);
end;
procedure QuickSort(var arr: array of Integer);     // ��������� ��������� ��� ������� ���������� c ���������
var size: Integer;
begin
  size:= Length(arr);
  Sort(arr, 1, size-1); // �������� � ������� ��������, ��� ��� ������� ��� �������� � ������ �����������, � ��� ���� �� Sort(arr, 0, size-1);
end;  


// ������� ���������� ��� ��������:
procedure QuickSortNonRecursive(var arr: array of Integer);
var i, j, L, R, s : Integer;
    x, w : Integer;
    stackLow, stackHigh: array of Integer; // ����� ��������
    size: Integer;
begin
  size:= Length(arr);
  SetLength(stackLow, size);  // ��������� ����� ����������� �������
  SetLength(stackHigh, size); 
  // ������� ������� �� �������������, �� ��� �������� � ������ �����������, � ��� ���� �� s:=0;
  s := 1;  stackLow[0]:= 0; stackHigh[0]:= size - 1;
  repeat // ����� ������� ������ �� �����
    // L := stack[s].L; R := stack[s].R; s := s - 1;
    L:= stackLow[s]; R:= stackHigh[s]; s:= s - 1;
    repeat // ��������� ������� arr[L] ... arr[R]
      i := L; j := R;
      x := arr[(L + R) div 2];
      repeat
        while arr[i] < x do i := i + 1;
        while x < arr[j] do j := j - 1;
        if i <= j then
        begin
          w := arr[i]; arr[i] := arr[j]; arr[j] := w; i := i + 1; j := j - 1;
        end;
      until i > j;
      if i < R then // ��������� � ����� ����� �� ���������� ������ �����
      begin
        s:= s + 1; stackLow[s]:= i; stackHigh[s]:= R;
      end;
      R := j; // ������ L � R ������������ ����� �����
    until L >= R;
  until s <= 0;  // until s = -1;
end;

// ���������� ������ �������:
procedure SelectionSort(var arr: array of Integer);
var i, j, k : Integer;
    tmp: Integer;
    size : Integer;
begin
  size:= Length(arr);
  for i:= 1 to size - 2 do   // � ��������� for i:= 1 to size - 1 do, �� � ��� ��������� ������� size-1, � �� size
  begin
    k:=i;
    tmp:= arr[i];
    for j:= i + 1 to size - 1 do
    begin
      if arr[j] < tmp then
      begin
        k:= j;
        tmp:= arr[k];
      end;
    end;
    arr[k]:= arr[i];
    arr[i]:= tmp;
  end; 
end;


// ���������� ������� ������ (����������� ����������):
procedure BubbleSort(var arr: array of Integer);
var i, j : Integer;
    tmp : Integer;
    size : Integer;
begin
  size:= Length(arr);
  for i:= 2 to size - 1 do
  begin
    for j:= size - 1 downto i do
    begin
      if arr[j-1] > arr[j] then
      begin
        tmp:= arr[j-1];
        arr[j-1]:= arr[j];
        arr[j]:= tmp;
      end;
    end;
  end;
end;


// ��������� ���������� (�������� �������� � �������� ������, ����������� ����������� ����������):
procedure ShakerSort(var arr: array of Integer);
var k, j, L, R : Integer;
    tmp : Integer;
    size : Integer;
begin
  size:= Length(arr);
  L:= 2;
  R:= size; // � ��� ����� �� �� size - 1  ???
  k:= size; // � ��� ����� �� �� size - 1  ???
  repeat
    for j:= R downto L do   // ������ ������ ������
    begin
      if arr[j-1] > arr[j] then
      begin
        tmp:= arr[j-1];
        arr[j-1]:= arr[j];
        arr[j]:= tmp;
        k:= j; 
      end;
    end;
    L:= k + 1; // �������� ����� ������� ������
    for j:= L to R do   // ������ ����� �������
    begin
      if arr[j-1] > arr[j] then
      begin
        tmp:= arr[j-1];
        arr[j-1]:= arr[j];
        arr[j]:= tmp;
        k:= j; 
      end;
    end;
    R:= k - 1; // �������� ������ ������� �����
  until L > R;
end;

end.
