unit GameRules;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, GameMem;

type

{ TGameRules }

 TGameResult = (gaNone, gaPosition, gaText, gaColor, gaShape);
 TSetGameResult = set of TGameResult;

 TGameQuestion = record
   position: integer;
   text: string;
 end;

 TGameRules = class
 private
  FLevel: integer;
  FGameMem: TGameMem;
  FCount: integer;
  FCountOfWrongs: integer;
  FCountOfCorrectAnswers: integer;
  FTimeStart: TTimeStamp;
  FTimeSinceStart: TTimeStamp;
  FMaxWrongAnswers: integer;
  FCurrentQuestion: TGameQuestion;
  public
   property CurrentQuestion: TGameQuestion read FCurrentQuestion;

    procedure NewGame();
    function CheckUserAnswer(Answer: TSetGameResult) : TSetGameResult;
    function NextQuestion: TGameQuestion;

    constructor Create(Level: integer);
    destructor Destroy;
  end;

implementation

{ TGameRules }

procedure TGameRules.NewGame;
begin

end;

function TGameRules.CheckUserAnswer(Answer: TSetGameResult): TSetGameResult;
begin

end;

function TGameRules.NextQuestion: TGameQuestion;
begin
  FCurrentQuestion.position:=Random(9);
  FCurrentQuestion.text:=IntToStr(Random(9));
end;

constructor TGameRules.Create(Level: integer);
begin
  FLevel:=Level;
  FGameMem := TGameMem.Create(FLevel);
  Randomize;
end;

destructor TGameRules.Destroy;
begin
  FreeAndNil(FGameMem);
end;

end.

