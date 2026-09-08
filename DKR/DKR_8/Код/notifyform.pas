unit NotifyForm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  Math, MMSystem;

type

  { TTimeEndForm }

  TTimeEndForm = class(TForm)
    ExitBtn: TBitBtn;
    TimeEndText: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormResize(Sender: TObject);
  private

  public

  end;

var
  TimeEndForm: TTimeEndForm;

implementation

{$R *.lfm}

{ TTimeEndForm }

procedure TTimeEndForm.FormResize(Sender: TObject);
begin
  TimeEndText.Font.Size := Min(TimeEndForm.Height div 10, TimeEndForm.Width div 12);

  ExitBtn.Font.Size := Min(TimeEndForm.Height div 24, TimeEndForm.Width div 30);
end;

procedure TTimeEndForm.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
   sndPlaySound(nil, 0);
end;

end.

