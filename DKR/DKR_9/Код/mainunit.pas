unit MainUnit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, Grids, EditItem,
  SearchItem, SearchTable, LazUTF8;

type
  order = record
    INN: string[10];
    organization: string[60];
    contact: string[60];
    phone: string[20];
    debt: string[15];
  end;

type

  { TMainForm }

  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    FileActions: TMenuItem;
    EditItem: TMenuItem;
    DeleteItem: TMenuItem;
    ClearForm: TMenuItem;
    OpenFileDialog: TOpenDialog;
    SaveFileDialog: TSaveDialog;
    SortItem: TMenuItem;
    SearchItem: TMenuItem;
    IncreaseSort: TMenuItem;
    DecreaseSort: TMenuItem;
    ItemActions: TMenuItem;
    CreateFile: TMenuItem;
    OpenFile: TMenuItem;
    SaveFile: TMenuItem;
    SaveFileAs: TMenuItem;
    CloseFiles: TMenuItem;
    ExitProgram: TMenuItem;
    AddItem: TMenuItem;
    MainGrid: TStringGrid;
    procedure AddItemClick(Sender: TObject);
    procedure ClearFormClick(Sender: TObject);
    procedure CloseFilesClick(Sender: TObject);
    procedure CreateFileClick(Sender: TObject);
    procedure DecreaseSortClick(Sender: TObject);
    procedure DeleteItemClick(Sender: TObject);
    procedure EditItemClick(Sender: TObject);
    procedure ExitProgramClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure IncreaseSortClick(Sender: TObject);
    procedure MainGridCompareCells(Sender: TObject; ACol, ARow, BCol,
      BRow: Integer; var Result: integer);
    procedure OpenFileClick(Sender: TObject);
    procedure SaveFileAsClick(Sender: TObject);
    procedure SaveFileClick(Sender: TObject);
    procedure SearchItemClick(Sender: TObject);
  private

  public
    procedure SaveDataToFile(FileName: string);
    procedure ShowOrders(FOrders: array of order);
  end;

var
  MainForm: TMainForm;
  Ascending, isSave: boolean;
  currentFileName: string;
  fullOrders: array of order;

implementation

{$R *.lfm}

procedure TMainForm.SaveDataToFile(FileName: string);
var ordersF: file of order;
  oneOrder: order;
  i: integer;
begin
  if FileName = '' then exit;
  try
    try
      AssignFile(ordersF, FileName);
      rewrite(ordersF);
      oneOrder.INN := 'ORDERFILE';
      oneOrder.organization := 'ORDERFILE';
      oneOrder.contact := 'ORDERFILE';
      oneOrder.phone := 'ORDERFILE';
      oneOrder.debt := 'ORDERFILE';
      write(ordersF, oneOrder);
      for i:=0 to high(fullOrders) do begin
        write(ordersF, fullOrders[i]);
      end;
    finally
      closeFile(ordersF);
    end;
  except
    on E: EInOutError do
       showMessage('Ошибка записи файла, проверьте место на диске или права доступа файла');
    else
       showMessage('Ошибка записи файла');
  end;
end;

procedure TMainForm.ShowOrders(FOrders: array of order);
var
  i: Integer;
begin
  MainGrid.RowCount := 1;
  for i:=0 to High(FOrders) do
  begin
    MainGrid.RowCount := MainGrid.RowCount + 1;
    MainGrid.Cells[0, MainGrid.RowCount - 1] := FOrders[i].INN;
    MainGrid.Cells[1, MainGrid.RowCount - 1] := FOrders[i].organization;
    MainGrid.Cells[2, MainGrid.RowCount - 1] := FOrders[i].contact;
    MainGrid.Cells[3, MainGrid.RowCount - 1] := FOrders[i].phone;
    MainGrid.Cells[4, MainGrid.RowCount - 1] := FOrders[i].debt;
  end;
end;


{ TMainForm }


procedure TMainForm.FormCreate(Sender: TObject);
begin
  MainGrid.ColWidths[0] := round(MainForm.Width / 100 * 12);
  MainGrid.ColWidths[1] := round(MainForm.Width / 100 * 28);
  MainGrid.ColWidths[2] := round(MainForm.Width / 100 * 25);
  MainGrid.ColWidths[3] := round(MainForm.Width / 100 * 17);
  MainGrid.ColWidths[4] := round(MainForm.Width / 100 * 18);
  MainGrid.Cells[0, 0] := 'ИНН';
  MainGrid.Cells[1, 0] := 'Организация';
  MainGrid.Cells[2, 0] := 'Контактное лицо';
  MainGrid.Cells[3, 0] := 'Телефон';
  MainGrid.Cells[4, 0] := 'Задолженность';
  Application.Title := 'Управление заказами';
  isSave := True;
  currentFileName := '';
end;

procedure TMainForm.AddItemClick(Sender: TObject);
begin
  ItemForm.INNInput.text := '';
  ItemForm.OrganizationInput.text := '';
  ItemForm.ContactInput.text := '';
  ItemForm.PhoneInput.text := '';
  ItemForm.DebtInput.text := '';
  ItemForm.ModalResult:= mrNone;
  ItemForm.ShowModal;
  if ItemForm.ModalResult = mrOk then begin
    isSave := False;
    setLength(FullOrders, length(fullOrders)+1);
    fullOrders[high(fullOrders)].INN := ItemForm.INNInput.text;
    fullOrders[high(fullOrders)].organization := ItemForm.OrganizationInput.text;
    fullOrders[high(fullOrders)].contact := ItemForm.ContactInput.text;
    fullOrders[high(fullOrders)].phone := ItemForm.PhoneInput.text;
    fullOrders[high(fullOrders)].debt := ItemForm.DebtInput.text;
    showOrders(fullOrders);
  end;
end;

procedure TMainForm.ClearFormClick(Sender: TObject);
begin
  if MainGrid.RowCount = 1 then exit;
  if MessageDlg('Требуется подтверждение',
     'Вы действительно хотите удалить таблицу ?', mtConfirmation,
     [mbYes, mbNo], 2) = mrYes then begin
    MainGrid.RowCount := 1;
  end;
  isSave := False;
  SetLength(fullOrders, 0);
end;

procedure TMainForm.CloseFilesClick(Sender: TObject);
begin
  if MainGrid.RowCount = 1 then exit;
  if MessageDlg('Требуется подтверждение',
     'Вы действительно закрыть данный файл ?', mtConfirmation,
     [mbYes, mbNo], 2) = mrYes then begin
    MainGrid.RowCount := 1;
    currentFileName := '';
  end;
  isSave := False;
  SetLength(fullOrders, 0);
end;

procedure TMainForm.CreateFileClick(Sender: TObject);
var ordersF: file of order;
  oneOrder: order;
begin
  if MessageDlg('Требуется подтверждение',
     'Вы действительно хотите создать новый файл ?', mtConfirmation,
     [mbYes, mbNo], 2) = mrYes then begin
    try
      if not SaveFileDialog.Execute then exit;
      assignFile(ordersF, SaveFileDialog.FileName);
      currentFileName := SaveFileDialog.FileName;
      rewrite(ordersF);
      oneOrder.INN := 'ORDERFILE';
      oneOrder.organization := 'ORDERFILE';
      oneOrder.contact := 'ORDERFILE';
      oneOrder.phone := 'ORDERFILE';
      oneOrder.debt := 'ORDERFILE';
      write(ordersF, oneOrder);
      closeFile(ordersF);
      SetLength(fullOrders, 0);
      ShowOrders(fullOrders);
      isSave := True;
    except
      showMessage('не удалось создать файл');
    end
  end;
  isSave := False;
  SetLength(fullOrders, 0);
end;


procedure TMainForm.DecreaseSortClick(Sender: TObject);
var i: integer;
begin
  if MainGrid.RowCount = 1 then exit;
  Ascending := False;
  MainGrid.SortColRow(true, MainGrid.Col);
  SetLength(fullOrders, MainGrid.RowCount - 1);
  for i:=1 to MainGrid.RowCount-1 do
  begin
    fullOrders[i-1].INN := MainGrid.Cells[0, i];
    fullOrders[i-1].organization := MainGrid.Cells[1, i];
    fullOrders[i-1].contact := MainGrid.Cells[2, i];
    fullOrders[i-1].phone := MainGrid.Cells[3, i];
    fullOrders[i-1].debt := MainGrid.Cells[4, i];
  end;
  isSave := False;
end;

procedure TMainForm.DeleteItemClick(Sender: TObject);
var i: integer;
begin
  if MainGrid.RowCount = 1 then exit;
  if MainGrid.Row < 1 then begin
    ShowMessage('Выберите запись удаления');
    Exit;
  end;
  if MessageDlg('Требуется подтверждение',
     'Вы действительно хотите удалить строку с ' +
     MainGrid.Cells[1, MainGrid.Row] + ' ?', mtConfirmation,
     [mbYes, mbNo], 2) = mrYes then begin
    for i:=MainGrid.Row-1 to high(fullOrders) - 1 do begin
       fullOrders[i] := fullOrders[i+1];
    end;
    setLength(fullOrders, length(fullOrders) - 1);
    showOrders(fullOrders);
    isSave := False;
  end;
end;

procedure TMainForm.EditItemClick(Sender: TObject);
begin
  if MainGrid.RowCount = 1 then exit;
  if MainGrid.Row < 1 then begin
    ShowMessage('Выберите запись редактирования');
    Exit;
  end;
  ItemForm.INNInput.text := MainGrid.Cells[0, MainGrid.Row];
  ItemForm.OrganizationInput.text := MainGrid.Cells[1, MainGrid.Row];
  ItemForm.ContactInput.text := MainGrid.Cells[2, MainGrid.Row];
  ItemForm.PhoneInput.text := MainGrid.Cells[3, MainGrid.Row];
  ItemForm.DebtInput.text := MainGrid.Cells[4, MainGrid.Row];
  ItemForm.ModalResult:= mrNone;
  ItemForm.ShowModal;
  if ItemForm.ModalResult = mrOk then begin
    fullOrders[MainGrid.Row-1].INN := ItemForm.INNInput.text;
    fullOrders[MainGrid.Row-1].organization := ItemForm.OrganizationInput.text;
    fullOrders[MainGrid.Row-1].contact := ItemForm.ContactInput.text;
    fullOrders[MainGrid.Row-1].phone := ItemForm.PhoneInput.text;
    fullOrders[MainGrid.Row-1].debt := ItemForm.DebtInput.text;
    isSave := False;
    showOrders(fullOrders)
  end;
end;

procedure TMainForm.ExitProgramClick(Sender: TObject);
begin
  close;
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  if isSave = False then begin
    if messageDlg('Сохранить?', 'У вас не сохранены изменения файла. Вы хотите сохранить?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
      if currentFileName = '' then begin
        if not SaveFileDialog.Execute then exit;
        currentFileName := SaveFileDialog.FileName;
      end;
      SaveDataToFile(currentFileName);
    end;
  end;
  isSave := False;
end;

procedure TMainForm.IncreaseSortClick(Sender: TObject);
var i: integer;
begin
  if MainGrid.RowCount = 1 then exit;
  Ascending := True;
  MainGrid.SortColRow(true, MainGrid.Col);
  SetLength(fullOrders, MainGrid.RowCount - 1);
  for i:=1 to MainGrid.RowCount-1 do
  begin
    fullOrders[i-1].INN := MainGrid.Cells[0, i];
    fullOrders[i-1].organization := MainGrid.Cells[1, i];
    fullOrders[i-1].contact := MainGrid.Cells[2, i];
    fullOrders[i-1].phone := MainGrid.Cells[3, i];
    fullOrders[i-1].debt := MainGrid.Cells[4, i];
  end;
  isSave := False;
end;

procedure TMainForm.MainGridCompareCells(Sender: TObject; ACol, ARow, BCol,
  BRow: Integer; var Result: integer);
var
  sA, sB: string;
  dA, dB: Double;
  isNumA, isNumB: Boolean;
begin

  sA := MainGrid.Cells[ACol, ARow];
  sB := MainGrid.Cells[BCol, BRow];

  isNumA := TryStrToFloat(sA, dA);
  isNumB := TryStrToFloat(sB, dB);

  if Ascending then begin
    if (isNumA) and (isNumB) then begin
      if dA > dB then begin
        Result := 1
      end
      else if dB > dA then begin
        Result := -1
      end
      else Result := 0;
    end
    else begin
      Result := AnsiCompareText(sA, sB);
    end;
  end
  else begin
    if (isNumA) and (isNumB) then begin
      if dA > dB then begin
        Result := -1
      end
      else if dB > dA then begin
        Result := 1
      end
      else Result := 0;
    end
    else begin
      Result := -AnsiCompareText(sA, sB);
    end;
  end;
end;


procedure TMainForm.OpenFileClick(Sender: TObject);
var ordersF: file of order;
  oneOrder: order;
begin
  try
    if not OpenFileDialog.Execute then exit;
    AssignFile(ordersF, OpenFileDialog.FileName);
    try
      Reset(ordersF);
      MainGrid.RowCount := 1;
      if eof(ordersF) then begin
        showMessage('Файл пуст');
        exit;
      end;
      read(ordersF, oneOrder);
      if oneOrder.INN <> 'ORDERFILE' then begin
        showMessage('Неверный формат файла');
        exit;
      end;
      currentFileName := OpenFileDialog.FileName;
      SetLength(fullOrders, 0);
      while not eof(ordersF) do begin
        read(ordersF, oneOrder);
        setLength(fullOrders, length(fullOrders) + 1);
        fullOrders[High(fullOrders)] := oneOrder;
      end;
      showOrders(fullOrders);
      isSave := True;
    finally
      CloseFile(ordersF);
    end;
  except
    on E: EInOutError do
     if MessageDlg('Ошибка открытия файла', 'Файл не может быть открыт: возможно, он используется другим процессом. Создать новый?',
     mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
       try
         if not SaveFileDialog.Execute then exit;
         assignFile(ordersF, SaveFileDialog.FileName);
         currentFileName := SaveFileDialog.FileName;
         rewrite(ordersF);
         oneOrder.INN := 'ORDERFILE';
         oneOrder.organization := 'ORDERFILE';
         oneOrder.contact := 'ORDERFILE';
         oneOrder.phone := 'ORDERFILE';
         oneOrder.debt := 'ORDERFILE';
         write(ordersF, oneOrder);
         closeFile(ordersF);
         SetLength(fullOrders, 0);
         ShowOrders(fullOrders);
         isSave := True;
       except
         showMessage('не удалось создать файл');
       end;
     end
    else ShowMessage('Ошибка открытия файла');
  end;
end;

procedure TMainForm.SaveFileAsClick(Sender: TObject);
begin
  if MainGrid.RowCount = 1 then begin
    ShowMessage('Таблица пуста, файл не сохранён');
    exit;
  end;
  if not SaveFileDialog.Execute then exit;
  currentFileName := SaveFileDialog.FileName;
  SaveDataToFile(currentFileName);
  isSave := True;
end;

procedure TMainForm.SaveFileClick(Sender: TObject);
begin
  if MainGrid.RowCount = 1 then begin
    ShowMessage('Таблица пуста, файл не сохранён');
    exit;
  end;
  if currentFileName = '' then begin
    if not SaveFileDialog.Execute then exit;
    currentFileName := SaveFileDialog.FileName;
  end;
  SaveDataToFile(currentFileName);
  isSave := True;
end;

procedure TMainForm.SearchItemClick(Sender: TObject);
var filteredArrOrders: array of order;
  oneOrder: order;
  i: integer;
begin
  if MainGrid.RowCount = 1 then exit;
  SearchForm.TextInput.text := '';
  SearchForm.InputType.ItemIndex := 0;
  SearchForm.modalResult := mrNone;
  SearchForm.showModal;
  if SearchForm.modalResult = mrOk then begin
    for i:=1 to MainGrid.RowCount - 1 do begin
      case SearchForm.InputType.ItemIndex of
        0: if pos(Trim(SearchForm.TextInput.text), fullOrders[i-1].INN )= 0 then continue;
        1: if pos(Trim(SearchForm.TextInput.text), fullOrders[i-1].organization) = 0 then continue;
        2: if pos(Trim(SearchForm.TextInput.text), fullOrders[i-1].contact) = 0 then continue;
        3: if pos(Trim(SearchForm.TextInput.text), fullOrders[i-1].phone) = 0 then continue;
        4: if pos(Trim(SearchForm.TextInput.text), fullOrders[i-1].debt) = 0 then continue;
      end;
      oneOrder.INN := MainGrid.Cells[0, i];
      oneOrder.organization := MainGrid.Cells[1, i];
      oneOrder.contact := MainGrid.Cells[2, i];
      oneOrder.phone := MainGrid.Cells[3, i];
      oneOrder.debt := MainGrid.Cells[4, i];
      setLength(filteredArrOrders, length(filteredArrOrders) + 1);
      filteredArrOrders[High(filteredArrOrders)] := oneOrder;
    end;
    TableForm.Grid.RowCount := 1;
    for i := 0 to High(filteredArrOrders) do begin
      TableForm.Grid.RowCount := TableForm.Grid.RowCount + 1;
      TableForm.Grid.Cells[0, TableForm.Grid.RowCount - 1] := filteredArrOrders[i].INN;
      TableForm.Grid.Cells[1, TableForm.Grid.RowCount - 1] := filteredArrOrders[i].organization;
      TableForm.Grid.Cells[2, TableForm.Grid.RowCount - 1] := filteredArrOrders[i].contact;
      TableForm.Grid.Cells[3, TableForm.Grid.RowCount - 1] := filteredArrOrders[i].phone;
      TableForm.Grid.Cells[4, TableForm.Grid.RowCount - 1] := filteredArrOrders[i].debt;
    end;
    TableForm.ShowModal;
  end;
end;

end.

