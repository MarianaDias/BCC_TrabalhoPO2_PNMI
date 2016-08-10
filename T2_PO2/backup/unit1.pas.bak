unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, Grids, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btajuda: TBitBtn;
    btlimpar: TBitBtn;
    btcalcular: TBitBtn;
    epslon: TEdit;
    GroupBox2: TGroupBox;
    lbepslon: TLabel;
    n: TEdit;
    func: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    labeln: TLabel;
    coordenadas: TRadioButton;
    hooke: TRadioButton;
    gradiente: TRadioButton;
    newton: TRadioButton;
    gradconj: TRadioButton;
    fletcher: TRadioButton;
    davidon: TRadioButton;
    RadioGroup1: TRadioGroup;
    SpeedButton1: TSpeedButton;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    procedure btajudaClick(Sender: TObject);
    procedure btcalcularClick(Sender: TObject);
    procedure btlimparClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

type
  vetor= array of Extended;
var
  Form1: TForm1;
  f: String;
  epslonn: Extended;
  naux: Integer;
  xIni:Array[1..10] of Extended;

function FxRn(f: String; x: Vetor; colchetes: Boolean; var y: Extended): Word; stdcall;external 'Interpretador.dll';
function FxR1(f:String; x: Extended; var y:Extended):Word; stdcall; external 'Interpretador.dll';

implementation

{$R *.lfm}

{ TForm1 }

function DerivadaPrimeira (func:String;x,Epsillon: Extended; var d: Extended): Word;
var
  h,p,q,y1,y2 : Extended;
  k : Integer;
begin
  y1:=0;
  y2:= 0;
   h := 1000*Epsillon;
   FxR1(func,x+h,y1);
   FxR1(func,x-h,y2);
   p := (y1 - y2)/(2*h);
   for k := 1 to 10 do
     begin
       q := p;
       h := h/2;
       FxR1(func,x+h,y1);
       FxR1(func,x-h,y2);
       p := (y1 - y2)/(2*h);
       if abs(p-q) < Epsillon   then
          Break;
     end;
    d := p;
    Result:= 0;
end;


function DerivadaSegunda (func: String;x,Epsillon : Extended;var d :Extended) : Word;
var
  h,p,q,y1,y2,y3 : Extended;
  k : Integer;
begin
   y1:= 0;
   y2 := 0;
   y3 :=0;
   h := 1000*Epsillon;
   FxR1(func,x+2*h,y1);
   FxR1(func,x,y2);
   FxR1(func,x-2*h,y3);
   p := (y1 - 2*y2+ y3)/(4*h*h);
   for k := 1 to 10 do
    begin
     q := p;
     h := h/2;
    FxR1(func,x+2*h,y1);
    FxR1(func,x,y2);
    FxR1(func,x-2*h,y3);
     p := (y1 - 2*y2+ y3)/(4*h*h);
   if abs(p-q) < Epsillon then
      Break;
     end;
   d :=p;
   Result := 0;
end;

function MNewton(string func);
var
  x,y,d1,d2,min : Extended;
  stop : Boolean;
begin
  //Para entrar a primeira vez
  d1:= epslon+1;
  d2 := 0;
  x := a;
  stop := false;

  while (d1 > epslon) and (not stop) do
  begin
   DerivadaPrimeira(func,x,0.001,d1);
   DerivadaSegunda(func,x,0.001,d2);
   y := x;
   if d2 <> 0  then
      x := x - (d1/d2);
   //Criterios de Parada
   if x > 1 then
   begin
     if abs ((x-y)/x) < epslon then
       stop := true;
   end
   else if abs (x-y) < epslon then
       stop:= true;
   DerivadaPrimeira(func,x,0.001,d1);
  end;
  min := x;
  Result:= min;
end;



procedure CoordenadasCiclicas();
begin

end;

procedure HookeJeeves();
var
  d1,d2 : Array[1..2] of Extended;
  y,x : Array[1..10] of Extended;
  j,i : Integer;
  lambda : Exteded;
  parte1, parte2 : string;
begin
   //direções coordenadas
   d1[1] = 1;
   d1[2] = 0;
   d2[1] = 0;
   d2[1] = 1;
   for i = 1 to i <= naux do
       x[i] = xIni[i];
   for(j = 1 to j< naux) do
   begin

   end;

end;

procedure Pgradiente();
begin

end;

procedure Pnewton();
begin

end;

procedure GradienteConjugado();
begin

end;

procedure FletcherReeves();
begin

end;

procedure Pdavidon();
begin

end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  i:integer;
begin
     try
       naux:=StrToInt(n.Text);
     except
       begin
            ShowMessage('Numero de componentes de x inválido.');
            Exit;
       end;
     end;
     if naux<1 then
        begin
          ShowMessage('Numero de componentes de x inválido.');
          Exit;
        end;
     if naux>10 then
        begin
          ShowMessage('Numero de componentes de x inválido.');
          Exit;
        end;
     StringGrid1.ColCount := naux+1;
     StringGrid2.ColCount := naux+1;
     StringGrid1.Cells[0, 0] := 'i';
     StringGrid1.Cells[0, 1] := 'x[i]';
     for i := 1 to naux do
         StringGrid1.Cells[i, 0] := IntToStr(i);
end;

procedure TForm1.btlimparClick(Sender: TObject);
begin
     n.Clear;
     func.Clear;
     epslon.Clear;
     StringGrid1.Clear;
     StringGrid2.Clear;
end;

procedure TForm1.btcalcularClick(Sender: TObject);
var
 i:integer;
begin
     try
        begin
             f:= Trim(func.Text);
        end;
     except
        begin
            ShowMessage('Funcao invalida.');
            Exit;
        end;
     end;
     if f ='' then
     begin
          ShowMessage('Funcao invalida.');
          Exit;
     end;
     try
        begin
             epslonn:=StrtoFloat(epslon.Text);
        end;
     except
        begin
            ShowMessage('Epslon invalido.');
            Exit;
        end;
     end;
     for i := 1 to naux do
         begin
             try
               begin
                    xIni[i]:=StrToFloat(StringGrid1.Cells[i, 1]);
               end;
             except
                begin
                     ShowMessage('Valor de x invalido.');
                     Exit;
                end;
             end;
         end;
     for i := 1 to naux do
         begin
         StringGrid2.Cells[i, 1] := FloatToStr(x[i]);
         end;

     if coordenadas.Checked then
        begin
             CoordenadasCiclicas();
        end
     else if hooke.Checked then
        begin
             HookeJeeves();
        end
     else if gradiente.Checked then
        begin
             Pgradiente();
        end
     else if newton.Checked then
        begin
             Pnewton();
        end
     else if gradconj.Checked then
        begin
             GradienteConjugado();
        end
     else if fletcher.Checked then
        begin
             FletcherReeves();
        end
     else if davidon.Checked then
        begin
             Pdavidon();
        end;
end;

procedure TForm1.btajudaClick(Sender: TObject);
begin

end;

end.

