program Project2;

{$APPTYPE CONSOLE}

uses
  EsConsole in 'EsConsole.pas', // Подключаем модуль русификации консоли
  Math, Windows,
  mySortLib in 'mySortLib.pas'; // Подключаем модуль сортировки массива





var a0, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10 : array of Integer; // Одномерный динамический массив для хранения промежуточного сортированного массива
    i : Integer;
    t1, t2: LongInt;
    ssize, start, finish: Integer;

// ------------------------------------- ТЕЛО ОСНОВНОЙ ПРОГРАММЫ ---------------------------------------

begin
  { TODO -oUser -cConsole Main : Insert code here }

  // Выводим сообщение на экран об условиях задачи:
  Writeln('Задайте число элементов и диапазон для генерирования (size, start, end, например, 10 0 5):');

  read(ssize);
  read(start);
  read(finish);



  SetLength(a0, ssize + 1);
  SetLength(a1, ssize + 1); // Установка длины одномерного массива
  SetLength(a2, ssize + 1); // Установка длины одномерного массива
  SetLength(a3, ssize + 1); // Установка длины одномерного массива
  SetLength(a4, ssize + 1); // Установка длины одномерного массива
  SetLength(a5, ssize + 1); // Установка длины одномерного массива
  SetLength(a6, ssize + 1); // Установка длины одномерного массива
  SetLength(a7, ssize + 1); // Установка длины одномерного массива
  SetLength(a8, ssize + 1); // Установка длины одномерного массива
  SetLength(a9, ssize + 1); // Установка длины одномерного массива
  SetLength(a10, ssize + 1); // Установка длины одномерного массива
  // for i := 0 to Length(a)-1 do a[i] := i * 5;
  //  a[0]:=44; a[1]:=55; a[2]:=12; a[3]:=42; a[4]:=94; a[5]:=18; a[6]:=6; a[7]:=67;

  a0[0]:= 0; // Заглушка
  a1[0]:= 0; // Заглушка
  a2[0]:= 0; // Заглушка
  a3[0]:= 0; // Заглушка
  a4[0]:= 0; // Заглушка
  a5[0]:= 0; // Заглушка
  a6[0]:= 0; // Заглушка
  a7[0]:= 0; // Заглушка
  a8[0]:= 0; // Заглушка
  a9[0]:= 0; // Заглушка
  a10[0]:= 0; // Заглушка
  Randomize;  for i:=1 to Length(a0) - 1 do
  begin
  a0[i]:= RandomRange(start, finish);
  a1[i]:= a0[i];
  a2[i]:= a0[i];
  a3[i]:= a0[i];
  a4[i]:= a0[i];
  a5[i]:= a0[i];
  a6[i]:= a0[i];
  a7[i]:= a0[i];
  a8[i]:= a0[i];
  a9[i]:= a0[i];
  a10[i]:= a0[i];
  end;


  {*
  // for i := 1 to Length(a0)-1 do Write(a0[i], '; '); Writeln;  // Выводим исходный массив

  // Засекаем время:
  t1:= GetTickCount;
  // Выполняем сортировку массива:
  InsertionSort(a1);//SelectionSort(a1);// BubbleSort(a1);//ShakerSort(a1); //InsertionSort(a1); // InsertionSortBisection(a);
  // Засекаем конечное время:
  t2:= GetTickCount;
  //for i:= 1 to Length(a1)-1 do Write(a1[i], '; '); Writeln;  // Выводим отсортированный массив
  Writeln('Длительность сортировки прямыми вставками: ', t2-t1, ' мс');

  // Засекаем время:
  t1:= GetTickCount;
  // Выполняем сортировку массива:
  InsertionSortBisection(a2);//SelectionSort(a1);// BubbleSort(a1);//ShakerSort(a1); //InsertionSort(a1); // InsertionSortBisection(a);
  // Засекаем конечное время:
  t2:= GetTickCount;
  //for i:= 1 to Length(a2)-1 do Write(a2[i], '; '); Writeln;  // Выводим отсортированный массив
  Writeln('Длительность сортировки прямыми вставками с бисекцией: ', t2-t1, ' мс');

  // Засекаем время:
  t1:= GetTickCount;
  // Выполняем сортировку массива:
  QuickSort(a3);//SelectionSort(a1);// BubbleSort(a1);//ShakerSort(a1); //InsertionSort(a1); // InsertionSortBisection(a);
  // Засекаем конечное время:
  t2:= GetTickCount;
  //for i:= 1 to Length(a3)-1 do Write(a3[i], '; '); Writeln;  // Выводим отсортированный массив
  Writeln('Длительность быстрой сортировки с рекурсией: ', t2-t1, ' мс');
  *}
  // Засекаем время:
  t1:= GetTickCount;
  // Выполняем сортировку массива:
  QuickSortNonRecursive(a4);//SelectionSort(a1);// BubbleSort(a1);//ShakerSort(a1); //InsertionSort(a1); // InsertionSortBisection(a);
  // Засекаем конечное время:
  t2:= GetTickCount;
  //for i:= 1 to Length(a4)-1 do Write(a4[i], '; '); Writeln;  // Выводим отсортированный массив
  Writeln('Длительность быстрой сортировки без рекурсии: ', t2-t1, ' мс');
 {*
  // Засекаем время:
  t1:= GetTickCount;
  // Выполняем сортировку массива:
  SelectionSort(a5);//SelectionSort(a1);// BubbleSort(a1);//ShakerSort(a1); //InsertionSort(a1); // InsertionSortBisection(a);
  // Засекаем конечное время:
  t2:= GetTickCount;
  //for i:= 1 to Length(a5)-1 do Write(a5[i], '; '); Writeln;  // Выводим отсортированный массив
  Writeln('Длительность сортировки прямым выбором: ', t2-t1, ' мс');

  // Засекаем время:
  t1:= GetTickCount;
  // Выполняем сортировку массива:
  BubbleSort(a6);//SelectionSort(a1);// BubbleSort(a1);//ShakerSort(a1); //InsertionSort(a1); // InsertionSortBisection(a);
  // Засекаем конечное время:
  t2:= GetTickCount;
  //for i:= 1 to Length(a6)-1 do Write(a6[i], '; '); Writeln;  // Выводим отсортированный массив
  Writeln('Длительность сортировки пузырьком: ', t2-t1, ' мс');
  *}
  // Засекаем время:
  t1:= GetTickCount;
  // Выполняем сортировку массива:
  ShakerSort(a7);//SelectionSort(a1);// BubbleSort(a1);//ShakerSort(a1); //InsertionSort(a1); // InsertionSortBisection(a);
  // Засекаем конечное время:
  t2:= GetTickCount;
  //for i:= 1 to Length(a7)-1 do Write(a7[i], '; '); Writeln;  // Выводим отсортированный массив
  Writeln('Длительность шейкерной сортировки: ', t2-t1, ' мс');



  Readln;    Readln;

end.
