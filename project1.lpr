program project1;

{$mode objfpc}{$H+}

uses {$IFDEF UNIX}{$IFDEF UseCThreads}
     cthreads,
     {$ENDIF}{$ENDIF}
     Classes, SysUtils, CustApp, UArbol, UNodo, ULista, UParse;

type

    { TMyApplication }

    TMyApplication = class(TCustomApplication)
    protected
        procedure DoRun; override;
    public
    end;

{ TMyApplication }

procedure TMyApplication.DoRun;
var objeto : CParse;
  a: integer;
  b: integer;
begin
    objeto := CParse.Create();
    objeto.m_expresion := '2+3*(2+3)';

    objeto.RecivirVAriable('y',11);
    objeto.RecivirVAriable('x',12);
    WriteLn(objeto.m_expresion);
    WriteLn( objeto.Evaluar() );

    objeto.RecivirVAriable('x',20);
    objeto.RecivirVAriable('y',22);
    objeto.RecivirVAriable('x',2);
    a := 0;

    while (a<Length(objeto.m_MemoriaVar)) do begin
      WriteLn(objeto.m_MemoriaVar[a] + ' = ' + FloatToStr(objeto.m_MemoriaVal[a]));
      a := a + 1;
    end;

    objeto.Destroy();

    ReadLn;
end;

var Application : TMyApplication;
begin
    Application := TMyApplication.Create(nil);
    Application.Title := 'My Application';
    Application.Run;
    Application.Free;
end.

