program Servidor_King_01;

uses
  Vcl.Forms,
  U_Princ_Server in 'U_Princ_Server.pas' {Frm_Princ_Server},
  U_DM_01_Server in 'U_DM_01_Server.pas' {Dm_01_Server: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrm_Princ_Server, Frm_Princ_Server);
  Application.CreateForm(TDm_01_Server, Dm_01_Server);
  Application.Run;
end.
