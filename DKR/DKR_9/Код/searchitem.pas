unit SearchItem;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, MaskEdit,
  Buttons, ExtCtrls, Math;

type

  { TSearchForm }

  TSearchForm = class(TForm)
    InputPanel: TPanel;
    SearchButton: TBitBtn;
    CancelButton: TBitBtn;
    InputType: TComboBox;
    InputTypeLabel: TLabel;
    InputLabel: TLabel;
    ButtonsPanel: TPanel;
    TextInput: TMaskEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure InputTypeSelect(Sender: TObject);
    procedure TextInputValidationError(Sender: TObject);
  private

  public

  end;

var
  SearchForm: TSearchForm;

implementation

{$R *.lfm}

{ TSearchForm }

procedure TSearchForm.CancelButtonClick(Sender: TObject);
begin
  close;
end;

procedure TSearchForm.FormResize(Sender: TObject);
begin
  ButtonsPanel.height := SearchForm.height div 4;

  SearchForm.InputTypeLabel.font.size := min(SearchForm.width div 60, SearchForm.height div 40);
  SearchForm.InputType.font.size := min(SearchForm.width div 60, SearchForm.height div 40);
  SearchForm.InputLabel.font.size := min(SearchForm.width div 60, SearchForm.height div 40);
  SearchForm.TextInput.font.size := min(SearchForm.width div 60, SearchForm.height div 40);
  SearchForm.SearchButton.font.size := min(SearchForm.width div 50, SearchForm.height div 25);
  SearchForm.CancelButton.font.size := min(SearchForm.width div 50, SearchForm.height div 25);
  TextInput.EditMask := '0000000000;1;_'
end;

procedure TSearchForm.InputTypeSelect(Sender: TObject);
begin
  if InputType.text = 'ИНН' then begin
    TextInput.EditMask := '0000000000;1;_'
  end
  else if InputType.text = 'Организация' then begin
    TextInput.EditMask := '';
    TextInput.MaxLength := 30;
  end
  else if InputType.text = 'Контактное лицо' then begin
    TextInput.EditMask := '';
    TextInput.MaxLength := 30;
  end
  else if InputType.text = 'Телефон' then begin
    TextInput.EditMask := '+7(000)-000-00-00;1;_';
  end
  else if InputType.text = 'Задолженность' then begin
    TextInput.EditMask := '';
    TextInput.MaxLength := 15;
  end
end;

procedure TSearchForm.TextInputValidationError(Sender: TObject);
begin
  showMessage('Строка введена не до конца')
end;

end.

