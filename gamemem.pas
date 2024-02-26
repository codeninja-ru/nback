unit GameMem;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type

  TGameStep = record
    PlaceNumber: integer;
    Text: string;
    Prev: ^TGameStep;
  end;
  { TGameMem }

  TGameMem = class
  const
    MAX_LEVEL = 10;
  private
    FLevel: integer;
    FCurrentPlace: integer;
    FMem: array[1..MAX_LEVEL] of TGameStep;
    PFirstGameStep: ^TGameStep;
    PLastGameStep: ^TGameStep;
    procedure SetLevel(Value: integer);
    function GetCurrent: TGameStep;
  public
    property Current: TGameStep read GetCurrent;
    procedure Add(PlaceNumber: integer; Text: string);

    constructor Create(Level: integer);
    destructor Destroy;
  end;


implementation

{ TGameMem }

procedure TGameMem.SetLevel(Value: integer);
begin
  if FLevel = Value then exit;
  if FLevel > MAX_LEVEL then raise Exception.Create('too many levels');
  FLevel := Value;
  FCurrentPlace := 0;
  PFirstGameStep := nil;
  PLastGameStep := nil;
end;

function TGameMem.GetCurrent: TGameStep;
begin
  Result := PLastGameStep^;
end;

procedure TGameMem.Add(PlaceNumber: integer; Text: string);
var
  PTmp: ^TGameStep;
begin
  if FCurrentPlace < FLevel then
  begin
    Inc(FCurrentPlace);
    FMem[FCurrentPlace].PlaceNumber := PlaceNumber;
    FMem[FCurrentPlace].Text := Text;
    FMem[FCurrentPlace].Prev := nil;

    if FCurrentPlace = 1 then
    begin
      PFirstGameStep := @FMem[FCurrentPlace];
      PLastGameStep := @FMem[FCurrentPlace];
    end
    else
    begin
      FMem[FCurrentPlace].Prev := @FMem[FCurrentPlace - 1];
      PFirstGameStep := @FMem[FCurrentPlace];
    end;
  end
  else
  begin
    PTmp := PLastGameStep^.Prev;
    PLastGameStep^.PlaceNumber := PlaceNumber;
    PLastGameStep^.Text := Text;
    PLastGameStep^.Prev := nil;
    PFirstGameStep^.Prev := PLastGameStep;
    PLastGameStep := PTmp;
  end;
end;

constructor TGameMem.Create(Level: integer);
begin
  SetLevel(Level);
end;

destructor TGameMem.Destroy;
begin

end;

end.
