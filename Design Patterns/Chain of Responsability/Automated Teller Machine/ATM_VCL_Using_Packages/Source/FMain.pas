unit FMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, UBancomat;

type
  TfrmATM = class(TForm)
    btnPreleva: TButton;
    edtImporto: TLabeledEdit;
    procedure btnPrelevaClick(Sender: TObject);
  end;

var
  frmATM: TfrmATM;

implementation

{$R *.dfm}

procedure TfrmATM.btnPrelevaClick(Sender: TObject);
var
  LATM: TSuperATM;
  LImporto, LBanconote: string;
begin
  LImporto := edtImporto.Text;

  LATM := TSuperATM.Create;

  try
    LATM.ImportoDaPrelevare := LImporto.ToInteger;
    LBanconote := LATM.Preleva;
  finally
    LATM.Free
  end;

  if (LBanconote <> '') then
    Application.MessageBox(PChar('Banconote erogate... ' + LBanconote), PChar('ATM'), MB_OK)
  else
    Application.MessageBox(PChar('Nessuna banconota erogata!!'), PChar('ATM'), MB_OK);
end;

end.
