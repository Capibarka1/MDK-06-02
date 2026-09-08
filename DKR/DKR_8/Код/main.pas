unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls, Menus, Types, MMSystem, LCLType, ActnList, Math, uNotifyForm;

type

  { TMainForm }

  TMainForm = class(TForm)
    ExitMenu: TMainMenu;
    Goodbye: TMenuItem;
    PlusTime: TButton;
    MinusTime: TButton;
    InputTime: TPanel;
    ChangeHour: TRadioButton;
    ChangeMinute: TRadioButton;
    ChangeSecond: TRadioButton;
    StopTimer: TButton;
    StartTimer: TButton;
    TimeLabel: TLabel;
    TimerInterval: TTimer;
    procedure ChangeHourChange(Sender: TObject);
    procedure ChangeMinuteChange(Sender: TObject);
    procedure ChangeSecondChange(Sender: TObject);
    procedure GoodbyeClick(Sender: TObject);
    procedure MinusTimeClick(Sender: TObject);
    procedure PlusTimeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure StartTimerClick(Sender: TObject);
    procedure StopTimerClick(Sender: TObject);
    procedure TimeLabelMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure TimeLabelMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure TimerIntervalTimer(Sender: TObject);
  private

  public

  end;

var
  MainForm: TMainForm;
  start: boolean;
  TimeChange: string;

implementation

{$R *.lfm}

{ TMainForm }

function ChangeTime(num: string; up: boolean; Time: string): string;
var sec, min, hour: integer;
  strsec, strmin, strhour: string;
begin
  sec := StrToInt(num[7] + num[8]);
  min := StrToInt(num[4] + num[5]);
  hour := StrToInt(num[1] + num[2]);
  if up then begin
     if Time = 'Hour' then hour := hour + 1
     else if Time = 'Minute' then min := min + 1
     else sec := sec + 1;
     if sec = 60 then begin
        min := min + 1;
        sec := 0;
     end;
     if min = 60 then begin
        hour := hour + 1;
        min := 0;
     end;
     if hour = 24 then begin
        hour := 0;
     end;
  end
  else begin
    if Time = 'Hour' then hour := hour - 1
    else if Time = 'Minute' then min := min - 1
    else sec := sec - 1;
    if sec = -1 then begin
       min := min - 1;
       sec := 59;
    end;
    if min = -1 then begin
       hour := hour - 1;
       min := 59;
    end;
    if hour = -1 then begin
       hour := 23;
    end;
  end;
  if sec < 10 then strsec := '0' + IntToStr(sec)
  else strsec := IntToStr(sec);
  if min < 10 then strmin := '0' + IntToStr(min)
  else strmin := IntToStr(min);
  if hour < 10 then strhour := '0' + IntToStr(hour)
  else strhour := IntToStr(hour);
  ChangeTime := strhour + ':' + strmin + ':' + strsec;
end;

function GetSec(num: string): integer;
begin
  GetSec := StrToInt(num[7] + num[8])
end;

function GetMin(num: string): integer;
begin
  GetMin := StrToInt(num[4] + num[5])
end;

function GetHour(num: string): integer;
begin
  GetHour := StrToInt(num[1] + num[2])
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  TimeLabel.Width := MainForm.Width div 2;
  TimeLabel.Left := MainForm.Width div 2 - TimeLabel.Width div 2;
  TimeLabel.Height := MainForm.Height div 3;
  TimeLabel.Top := MainForm.Height div 3 - TimeLabel.Height div 3;
  TimeLabel.Font.Size := Min(TimeLabel.Height div 4, TimeLabel.Width div 8);

  InputTime.Left := MainForm.Width div 2 - InputTime.width div 2;
  InputTime.Top := TimeLabel.Top + TimeLabel.Height;

  ChangeSecond.Font.Size := Min(TimeLabel.Height div 12, TimeLabel.Width div 10);
  ChangeMinute.Font.Size := Min(TimeLabel.Height div 12, TimeLabel.Width div 10);
  ChangeHour.Font.Size := Min(TimeLabel.Height div 12, TimeLabel.Width div 10);
  PlusTime.Font.Size := Min(TimeLabel.Height div 12, TimeLabel.Width div 10);
  MinusTime.Font.Size := Min(TimeLabel.Height div 12, TimeLabel.Width div 10);

  if InputTime.width > MainForm.Width - 20 then begin
     InputTime.ChildSizing.ControlsPerLine := 3;
  end;
  if InputTime.width < round(MainForm.Width * 0.6) then begin
     InputTime.ChildSizing.ControlsPerLine := 5;
  end;

  StartTimer.Width := MainForm.Width div 4;
  StartTimer.Height := MainForm.Height div 6;
  StartTimer.Left := MainForm.Width div 2 - TimeLabel.Width div 2;
  StartTimer.Top := TimeLabel.Top + round(TimeLabel.Height * 1.8);
  StartTimer.Font.Size := Min(StartTimer.Height div 4, StartTimer.Width div 8);

  StopTimer.Width := MainForm.Width div 4;
  StopTimer.Height := MainForm.Height div 6;
  StopTimer.Left := MainForm.Width div 2;
  StopTimer.Top := TimeLabel.Top + round(TimeLabel.Height * 1.8);
  StopTimer.Font.Size := Min(StopTimer.Height div 4, StopTimer.Width div 8);
end;

procedure TMainForm.StartTimerClick(Sender: TObject);
begin
  if (GetHour(TimeLabel.caption)=0) and (GetMin(TimeLabel.caption)=0) and (GetSec(TimeLabel.caption)=0) then begin
    start := False;
    exit();
  end;
  start := True;
end;

procedure TMainForm.StopTimerClick(Sender: TObject);
begin
  start := False;
end;

procedure TMainForm.TimeLabelMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
var strnum: string;
begin
  if start then exit();
  strnum := ChangeTime(TimeLabel.caption, False, TimeChange);
  TimeLabel.Caption := strnum
end;

procedure TMainForm.TimeLabelMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
var strnum: string;
begin
  if start then exit();
  strnum := ChangeTime(TimeLabel.caption, True, TimeChange);
  TimeLabel.Caption := strnum
end;

procedure TMainForm.TimerIntervalTimer(Sender: TObject);
var strnum: string;
begin
  if (GetHour(TimeLabel.caption)=0) and (GetMin(TimeLabel.caption)=0) and (GetSec(TimeLabel.caption)=0) then begin
    if start then begin
      uNotifyForm.TimeEndForm.Visible := true;
      sndPlaySound('alarm.wav', SND_ASYNC or SND_LOOP);
    end;
    start := False;
    exit();
  end;
  if start then begin
    strnum := ChangeTime(TimeLabel.caption, False, 'second');
    TimeLabel.Caption := strnum;
  end;
end;


procedure TMainForm.ChangeHourChange(Sender: TObject);
begin
  TimeChange := 'Hour';
end;

procedure TMainForm.ChangeMinuteChange(Sender: TObject);
begin
  TimeChange := 'Minute';
end;

procedure TMainForm.ChangeSecondChange(Sender: TObject);
begin
  TimeChange := 'Second';
end;

procedure TMainForm.GoodbyeClick(Sender: TObject);
begin
  close;
end;

procedure TMainForm.MinusTimeClick(Sender: TObject);
var strnum: string;
begin
  if start then exit();
  strnum := ChangeTime(TimeLabel.caption, False, TimeChange);
  TimeLabel.Caption := strnum
end;

procedure TMainForm.PlusTimeClick(Sender: TObject);
var strnum: string;
begin
  if start then exit();
  strnum := ChangeTime(TimeLabel.caption, True, TimeChange);
  TimeLabel.Caption := strnum
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  start := False;
  TimeChange := 'Second';
  ChangeSecond.Checked := True;
end;

end.

