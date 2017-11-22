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
    MostrarForm1: TMenuItem;
    EsconderForm1: TMenuItem;
    Sair1: TMenuItem;
    Animar1: TMenuItem;
    Sincronizar1: TMenuItem;
    estar1: TMenuItem;
  private
    { Private declarations }
   TrayIconData: TNotifyIconData;
  public
    { Public declarations }
   procedure TrayMessage(var Msg: TMessage); message WM_ICONTRAY;
   procedure DrawBar(ACanvas: TCanvas);
  end;

var
  Frm_Princ_Server: TFrm_Princ_Server;

implementation

{$R *.dfm}

{ TFrm_Princ_Server }

procedure TFrm_Princ_Server.DrawBar(ACanvas: TCanvas);
var
  lf : TLogFont;
  tf : TFont;
begin
  with ACanvas do begin
    Brush.Color := clSkyBlue;
    FillRect(Rect(0,0,20,122));
    Font.Name := 'Tahoma';
    Font.Size := 7;
    Font.Style := Font.Style - [fsBold];
    Font.Color := clWhite;
    tf := TFont.Create;
    try
      tf.Assign(Font);
      GetObject(tf.Handle, sizeof(lf), @lf);
      lf.lfEscapement := 900;
      lf.lfHeight := Font.Height - 2;
      tf.Handle := CreateFontIndirect(lf);
      Font.Assign(tf);
    finally
      tf.Free;
    end;
    TextOut(2, 98, ' Servidor King ');
  end;

end;

procedure TFrm_Princ_Server.TrayMessage(var Msg: TMessage);
var
  p : TPoint;
begin
  case Msg.lParam of
    WM_LBUTTONDBLCLK:
    begin
      Frm_Princ_Server.Show;
//      try
//       PageControl6.ActivePageIndex := 0;
//      except end;
    end;
    WM_RBUTTONDOWN:
    begin
       SetForegroundWindow(Handle);
       GetCursorPos(p);
       PM_Princ.Popup(p.x, p.y);
       PostMessage(Handle, WM_NULL, 0, 0);
    end;
  end;

end;

end.
