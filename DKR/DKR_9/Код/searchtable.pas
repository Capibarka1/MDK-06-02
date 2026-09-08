unit SearchTable;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids;

type

  { TTableForm }

  TTableForm = class(TForm)
    Grid: TStringGrid;
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  TableForm: TTableForm;

implementation

{$R *.lfm}

{ TTableForm }

procedure TTableForm.FormCreate(Sender: TObject);
begin
  Grid.ColWidths[0] := round(TableForm.Width / 100 * 12);
  Grid.ColWidths[1] := round(TableForm.Width / 100 * 28);
  Grid.ColWidths[2] := round(TableForm.Width / 100 * 25);
  Grid.ColWidths[3] := round(TableForm.Width / 100 * 17);
  Grid.ColWidths[4] := round(TableForm.Width / 100 * 18);
  Grid.Cells[0, 0] := 'ИНН';
  Grid.Cells[1, 0] := 'Организация';
  Grid.Cells[2, 0] := 'Контактное лицо';
  Grid.Cells[3, 0] := 'Телефон';
  Grid.Cells[4, 0] := 'Задолженность';
  Application.Title := 'Управление заказами';
end;

end.

