unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ActnList, Menus,
  ExtCtrls, StdActns, ComCtrls, Buttons, BCListBox, BCPanel, BCGameGrid, GameGrid;

type

  { TMainForm }

  TMainForm = class(TForm)
    AppActionList: TActionList;
    BCPanel1: TBCPanel;
    BCPanel2: TBCPanel;
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
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  FreeAndNil(GameGrid);
end;

end.

