unit mySortLib;

interface
// Объявление функций и процедур:
procedure InsertionSort(var arr: array of Integer);
procedure InsertionSortBisection(var arr: array of Integer);
procedure Sort(var arr: array of Integer; L, R: Integer); 
procedure QuickSort(var arr: array of Integer);
procedure QuickSortNonRecursive(var arr: array of Integer);
procedure SelectionSort(var arr: array of Integer);
procedure BubbleSort(var arr: array of Integer);
procedure ShakerSort(var arr: array of Integer);



implementation
// ---- Раздел реализаций ---


// Процедура сортировки массива целых чисел ПРЯМЫМ ВКЛЮЧЕНИЕМ
procedure InsertionSort(var arr: array of Integer);
var i,j: Integer;
    tmp : Integer; //   Временная переменная для хранения обрабатываемого элемента
    size : Integer; // Размер массива
begin
  size:= Length(arr); // Длина массива
  // Запускаем сортировку массива:
  for i:=1 to size-1 do
  begin
    tmp:= arr[i];  // Вытаскиваем текущий элемент
    arr[0]:= tmp; // Устанавливаем заглушку на нулевой элемент
    j:= i; // Запоминаем место
    while tmp < arr[j-1] do
    begin
      arr[j]:= arr[j-1];
      j:= j-1; // Шаг к началу
    end;
    arr[j]:= tmp; // Помещаем текущий элемент на подходящее место

  end;
end;


// Процедура сортировки массива целых чисел ПРЯМЫМ ВКЛЮЧЕНИЕМ МЕТОД БИСЕКЦИЙ
procedure InsertionSortBisection(var arr: array of Integer);
var i, j : Integer;
    M, L, R : Integer;
    tmp : Integer;
    size : Integer; // Размер массива
begin
  size:= Length(arr); // Длина массива
  // Запускаем сортировку промежуточного массива:
  for i:= 1 to size-1 do
  begin
    tmp:= arr[i];
    L:= 1;
    R:= i;
    while L < R do
    begin
      M:= (L + R) div 2;
      if arr[M] <= tmp then L:= M + 1  // Передвигаем границы
      else R:= M;
    end;
    for j:= i downto R+1 do
    begin
      arr[j]:= arr[j-1];   // Переместить все элементы вправо
    end;    
    arr[R]:= tmp; // Устанавливаем на подходящее место текущий элемент
  end;
end;


// Быстрая сортировка с рекурсией:
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
procedure QuickSort(var arr: array of Integer);     // Начальная процедура для быстрой сортировки c рекурсией
var size: Integer;
begin
  size:= Length(arr);
  Sort(arr, 1, size-1); // Начинаем с первого элемента, так как нулевой под заглушку в других сортировках, а так надо бы Sort(arr, 0, size-1);
end;  


// Быстрая сортировка без рекурсии:
procedure QuickSortNonRecursive(var arr: array of Integer);
var i, j, L, R, s : Integer;
    x, w : Integer;
    stackLow, stackHigh: array of Integer; // Стеки индексов
    size: Integer;
begin
  size:= Length(arr);
  SetLength(stackLow, size);  // Установка длины одномерного массива
  SetLength(stackHigh, size); 
  // Нулевой элемент не рассматриваем, он для заглушки в других сортировках, а так надо бы s:=0;
  s := 1;  stackLow[0]:= 0; stackHigh[0]:= size - 1;
  repeat // Взять верхний запрос со стека
    // L := stack[s].L; R := stack[s].R; s := s - 1;
    L:= stackLow[s]; R:= stackHigh[s]; s:= s - 1;
    repeat // Разделить сегмент arr[L] ... arr[R]
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
      if i < R then // Сохранить в стеке запрс на сортировку правой части
      begin
        s:= s + 1; stackLow[s]:= i; stackHigh[s]:= R;
      end;
      R := j; // Теперь L и R ограничивает левую часть
    until L >= R;
  until s <= 0;  // until s = -1;
end;

// Сортировка прямым выбором:
procedure SelectionSort(var arr: array of Integer);
var i, j, k : Integer;
    tmp: Integer;
    size : Integer;
begin
  size:= Length(arr);
  for i:= 1 to size - 2 do   // В оригинале for i:= 1 to size - 1 do, но у нас последняя позиция size-1, а не size
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


// Сортировка прямого обмена (Пузырьковая сортировка):
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


// Шейкерная сортировка (хождение зигзагом с сужением границ, модификация пузырьковой сортировки):
procedure ShakerSort(var arr: array of Integer);
var k, j, L, R : Integer;
    tmp : Integer;
    size : Integer;
begin
  size:= Length(arr);
  L:= 2;
  R:= size; // А тут точно не до size - 1  ???
  k:= size; // А тут точно не до size - 1  ???
  repeat
    for j:= R downto L do   // проход справа налево
    begin
      if arr[j-1] > arr[j] then
      begin
        tmp:= arr[j-1];
        arr[j-1]:= arr[j];
        arr[j]:= tmp;
        k:= j; 
      end;
    end;
    L:= k + 1; // Сдвигаем левую границу вправо
    for j:= L to R do   // проход слева направо
    begin
      if arr[j-1] > arr[j] then
      begin
        tmp:= arr[j-1];
        arr[j-1]:= arr[j];
        arr[j]:= tmp;
        k:= j; 
      end;
    end;
    R:= k - 1; // Сдвигаем правую границу влево
  until L > R;
end;

end.
