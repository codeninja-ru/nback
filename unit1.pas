unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ActnList, Menus,
  ExtCtrls, StdActns, ComCtrls, Buttons, CustomDrawnControls, BCListBox,
  BCPanel, BCGameGrid, BCButton, BGRAColorTheme, BGRAImageTheme, BGRATheme,
  BGRASVGTheme, BGRAThemeButton, BCSVGButton, LedNumber, GameGrid, GameRules;

type

  { TMainForm }

  TMainForm = class(TForm)
    AppActionList: TActionList;
    ButtonPanel: TBCPanel;
    CDButton2: TCDButton;
    CDButton3: TCDButton;
    StatsPanel: TBCPanel;
    GamePanel: TBCPanel;
    CDButton1: TCDButton;
    LEDNumber1: TLEDNumber;
    LEDNumber2: TLEDNumber;
    MainPanel: TBCPanel;
    FileExit: TFileExit;
    MainMenu: TMainMenu;
    FileMenuItem: TMenuItem;
    ExitMenuItem: TMenuItem;
    HelpMenuItem: TMenuItem;
    AboutMenuItem: TMenuItem;
    GameGridPanel: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure GameGridPanelPaint(Sender: TObject);
  private
     GameGrid: TGameGrid;
     GameRules: TGameRules;
  public

  end;

var
  MainForm: TMainForm;

implementation

{$R *.lfm}

{ TMainForm }

procedure TMainForm.GameGridPanelPaint(Sender: TObject);
begin
  GameGrid.Draw(GameGridPanel.Canvas);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  GameGrid := TGameGrid.Create();
  GameRules := TGameRules.Create(2);
  GameRules.NewGame();
  GameRules.NextQuestion();
  GameGrid.ActiveCell:=GameRules.CurrentQuestion.position;
  GameGrid.ActiveCellText:=GameRules.CurrentQuestion.text;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(GameGrid);
  FreeAndNil(GameRules);
end;

end.

