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
  x:Array[1..10] of Extended;

function FxRn(f: String; x: Vetor; colchetes: Boolean; var y: Extended): Word; stdcall;external 'Interpretador.dll';

implementation

{$R *.lfm}

{ TForm1 }
procedure CoordenadasCiclicas();
begin

end;

procedure HookeJeeves();
begin

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
                    x[i]:=StrToFloat(StringGrid1.Cells[i, 1]);
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

