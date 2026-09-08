unit EditItem;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, MaskEdit, Math,
  ExtCtrls, Buttons;

type

  { TItemForm }

  TItemForm = class(TForm)
    SaveButton: TBitBtn;
    CancelButton: TBitBtn;
    OrganizationInput: TEdit;
    ContactInput: TEdit;
    DebtInput: TEdit;
    INNLabel: TLabel;
    INNInput: TMaskEdit;
    ButtonPanel: TPanel;
    PhoneInput: TMaskEdit;
    OrganizationLabel: TLabel;
    ContactLabel: TLabel;
    PhoneLabel: TLabel;
    DebtLabel: TLabel;
    LabelPanel: TPanel;
    InputPanel: TPanel;
    procedure FormResize(Sender: TObject);
    procedure INNInputValidationError(Sender: TObject);
    procedure PhoneInputValidationError(Sender: TObject);
    procedure SaveButtonClick(Sender: TObject);
  private

  public

  end;

var
  ItemForm: TItemForm;

implementation

{$R *.lfm}

{ TItemForm }


procedure TItemForm.FormResize(Sender: TObject);
begin
  ItemForm.INNLabel.font.size := min(ItemForm.width div 100, ItemForm.height div 50);
  ItemForm.OrganizationLabel.font.size := min(ItemForm.width div 100, ItemForm.height div 50);
  ItemForm.ContactLabel.font.size := min(ItemForm.width div 100, ItemForm.height div 50);
  ItemForm.PhoneLabel.font.size := min(ItemForm.width div 100, ItemForm.height div 50);
  ItemForm.DebtLabel.font.size := min(ItemForm.width div 100, ItemForm.height div 50);

  ItemForm.INNInput.font.size := min(ItemForm.width div 100, ItemForm.height div 50);
  ItemForm.OrganizationInput.font.size := min(ItemForm.width div 100, ItemForm.height div 50);
  ItemForm.ContactInput.font.size := min(ItemForm.width div 100, ItemForm.height div 50);
  ItemForm.PhoneInput.font.size := min(ItemForm.width div 100, ItemForm.height div 50);
  ItemForm.DebtInput.font.size := min(ItemForm.width div 100, ItemForm.height div 50);

  ButtonPanel.height := ItemForm.height div 5;
  SaveButton.font.size := min(ItemForm.width div 75, ItemForm.height div 50);
  CancelButton.font.size := min(ItemForm.width div 75, ItemForm.height div 50);
end;

procedure TItemForm.INNInputValidationError(Sender: TObject);
begin
  showmessage('Не полностью введён ИНН')
end;

procedure TItemForm.PhoneInputValidationError(Sender: TObject);
begin
  showmessage('Не полностью введён телефон')
end;

procedure TItemForm.SaveButtonClick(Sender: TObject);
begin
  if (ItemForm.OrganizationInput.text = '') or (ItemForm.ContactInput.text = '') or  (ItemForm.DebtInput.text = '') then ItemForm.ModalResult:= mrNone;
  if ItemForm.INNInput.text = '          ' then ItemForm.ModalResult:= mrNone;
  if ItemForm.PhoneInput.text = '+7(   )-   -  -  ' then ItemForm.ModalResult:= mrNone;
  if ItemForm.ModalResult = mrNone then showMessage('Введены данные не во все поля')
end;

end.

