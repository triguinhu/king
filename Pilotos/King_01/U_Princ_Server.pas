unit U_Princ_Server;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  Winapi.ShellAPI,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ComCtrls,
  Vcl.Menus;

const
  WM_ICONTRAY = WM_USER + 1;

type
  TFrm_Princ_Server = class(TForm)
    StatusBar: TStatusBar;
    PM_Princ: TPopupMenu;
    Im_Ger_Serv: TMenuItem;
    Im_Min: TMenuItem;
    Im_Conf: TMenuItem;
    Im_Lic: TMenuItem;
    Im_Login: TMenuItem;
    Im_Sair: TMenuItem;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Im_Ger_ServDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure Im_MinDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure Im_ConfDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure Im_LicDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure Im_SairDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; Selected: Boolean);
    procedure Im_SairClick(Sender: TObject);
  private
    { Private declarations }
   aTrayIconData: TNotifyIconData;
  public
    { Public declarations }
   procedure TrayMessage(var aMsg: TMessage); message WM_ICONTRAY;
   procedure DrawBar(aACanvas: TCanvas);
  end;

var
  Frm_Princ_Server: TFrm_Princ_Server;

implementation

{$R *.dfm}

{ TFrm_Princ_Server }

procedure TFrm_Princ_Server.DrawBar(aACanvas: TCanvas);
var
  alf : TLogFont;
  atf : TFont;
begin

  with aACanvas do
  begin
    Brush.Color := clSkyBlue;
    FillRect(Rect(0,0,20,122));
    Font.Name := 'Tahoma';
    Font.Size := 7;
    Font.Style := Font.Style - [fsBold];
    Font.Color := clWhite;
    atf := TFont.Create;
    try
      atf.Assign(Font);
      GetObject(atf.Handle, sizeof(alf), @alf);
      alf.lfEscapement := 900;
      alf.lfHeight := Font.Height - 2;
      atf.Handle := CreateFontIndirect(alf);
      Font.Assign(atf);
    finally
      atf.Free;
    end;
    TextOut(2, 98, ' Servidor King ');
  end;

end;

procedure TFrm_Princ_Server.FormCreate(Sender: TObject);
begin

  PM_Princ.OwnerDraw:=True;

  with aTrayIconData do
  begin
    cbSize := SizeOf;
    Wnd := Handle;
    uID := 0;
    uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
    uCallbackMessage := WM_ICONTRAY;
    hIcon := Application.Icon.Handle;
    StrPCopy(szTip, Application.Title);
  end;

  Shell_NotifyIcon(NIM_ADD, @aTrayIconData);

end;

procedure TFrm_Princ_Server.FormDestroy(Sender: TObject);
begin
  Shell_NotifyIcon(NIM_DELETE, @aTrayIconData);
end;

procedure TFrm_Princ_Server.Im_ConfDrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
begin

  if Selected then
    ACanvas.Brush.Color := clHighlight
  else
    ACanvas.Brush.Color := clMenu;

  ARect.Left := 35;
  ACanvas.FillRect(ARect);

  DrawText(ACanvas.Handle, PChar('Configurações'), -1, ARect, DT_LEFT or DT_VCENTER or DT_SINGLELINE or DT_NOCLIP);

  DrawBar(ACanvas);

end;

procedure TFrm_Princ_Server.Im_Ger_ServDrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
begin

  if Selected then
    ACanvas.Brush.Color := clHighlight
  else
    ACanvas.Brush.Color := clMenu;

  ARect.Left := 35;
  ACanvas.FillRect(ARect);

  DrawText(ACanvas.Handle, PChar('Gerenciar Servidor'), -1, ARect, DT_LEFT or DT_VCENTER or DT_SINGLELINE or DT_NOCLIP);

end;

procedure TFrm_Princ_Server.Im_LicDrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
begin

  if Selected then
    ACanvas.Brush.Color := clHighlight
  else
    ACanvas.Brush.Color := clMenu;

  ARect.Left := 35;
  ACanvas.FillRect(ARect);

  DrawText(ACanvas.Handle, PChar('Registros/Logs'), -1, ARect, DT_LEFT or DT_VCENTER or DT_SINGLELINE or DT_NOCLIP);

end;

procedure TFrm_Princ_Server.Im_MinDrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
begin

  if Selected then
    ACanvas.Brush.Color := clHighlight
  else
    ACanvas.Brush.Color := clMenu;

  ARect.Left := 35;
  ACanvas.FillRect(ARect);

  DrawText(ACanvas.Handle, PChar('Minimizar'), -1, ARect, DT_LEFT or DT_VCENTER or DT_SINGLELINE or DT_NOCLIP);

end;

procedure TFrm_Princ_Server.Im_SairClick(Sender: TObject);
begin

  Application.Terminate;

end;

procedure TFrm_Princ_Server.Im_SairDrawItem(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; Selected: Boolean);
begin

  if Selected then
    ACanvas.Brush.Color := clHighlight
  else
    ACanvas.Brush.Color := clMenu;

  ARect.Left := 35;
  ACanvas.FillRect(ARect);

  DrawText(ACanvas.Handle, PChar('Sair'), -1, ARect, DT_LEFT or DT_VCENTER or DT_SINGLELINE or DT_NOCLIP);

  DrawBar(ACanvas);

end;

procedure TFrm_Princ_Server.TrayMessage(var aMsg: TMessage);
var
  ap : TPoint;
begin

  case aMsg.lParam of
    WM_LBUTTONDBLCLK:
    begin
      Frm_Princ_Server.Show;
    end;
    WM_RBUTTONDOWN:
    begin
       SetForegroundWindow(Handle);
       GetCursorPos(ap);
       PM_Princ.Popup(ap.x, ap.y);
       PostMessage(Handle, WM_NULL, 0, 0);
    end;
  end;

end;

end.
