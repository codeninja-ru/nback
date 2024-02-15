unit GameGrid;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, BGRABitmap, BGRABitmapTypes, Graphics;

type

  { TGameGrid }

  TGameGrid = class
  const
    GRID_SIZE = 3;
    GRID_LINE_WIDTH = 4;
    GRID_LINE_COLOR = $444444;
    GRID_PADDING = 10;
  private
    FBitmap: TBGRABitmap;
    FActiveCell: integer;

    procedure SetActiveCell(Value: integer);
    procedure DrawActiveCell(Bitmap: TBGRABitmap);
  public
    property ActiveCell: integer read FActiveCell write SetActiveCell;
    procedure Draw(Canvas: TCanvas);


    constructor Create();
    destructor Destroy();
  end;

implementation

{ TGameGrid }

procedure TGameGrid.SetActiveCell(Value: integer);
begin
  FActiveCell := Value;
end;

procedure TGameGrid.DrawActiveCell(Bitmap: TBGRABitmap);
var
  Width, Height, x, y: integer;
  GridWidth, GridHeight: integer;
begin
  if (FActiveCell < 0) or (FActiveCell > GRID_SIZE * GRID_SIZE) then exit;

  y := FActiveCell div GRID_SIZE;
  x := FActiveCell mod GRID_SIZE;

  Width := Bitmap.Width;
  Height := Bitmap.Height;

  GridWidth := Width div GRID_SIZE;
  GridHeight := Height div GRID_SIZE;

  Bitmap.FillRectAntialias(x * GRID_SIZE + GRID_PADDING,
    y * GridHeight + GRID_PADDING,
    x * GridWidth + GridWidth - GRID_PADDING,
    y * GridHeight + GridHeight - GRID_PADDING,
    clBlue);
end;

procedure TGameGrid.Draw(Canvas: TCanvas);
var
  Width, Height, i, x: integer;
  scaleFactor: real;
begin
  Width := Canvas.Width;
  Height := Canvas.Height;

  FBitmap := TBGRABitmap.Create(Width, Height);

  try
    for i := 1 to GRID_SIZE - 1 do
    begin
      x := Height div GRID_SIZE * i;
      FBitmap.DrawLineAntialias(0, x, Width - 1, x, GRID_LINE_COLOR, GRID_LINE_WIDTH);
      x := Width div GRID_SIZE * i;
      FBitmap.DrawLineAntialias(x, 0, x, Height - 1, GRID_LINE_COLOR,
        GRID_LINE_WIDTH);
      DrawActiveCell(FBitmap);
    end;
    FBitmap.Draw(Canvas, 0, 0, False);
  finally
    FreeAndNil(FBitmap);
  end;
end;

constructor TGameGrid.Create;
begin

end;

destructor TGameGrid.Destroy;
begin

end;

end.
