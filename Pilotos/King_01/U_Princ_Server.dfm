object Frm_Princ_Server: TFrm_Princ_Server
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Servidor de Aplica'#231#227'o - King - 01'
  ClientHeight = 545
  ClientWidth = 684
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar: TStatusBar
    Left = 0
    Top = 526
    Width = 684
    Height = 19
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = []
    Panels = <
      item
        Alignment = taCenter
        Text = 'King - Servidor de Aplica'#231#227'o'
        Width = 200
      end
      item
        Alignment = taCenter
        Text = 'Status: Em Funcionamento'
        Width = 50
      end>
    UseSystemFont = False
  end
  object PM_Princ: TPopupMenu
    Left = 328
    Top = 258
    object Im_Ger_Serv: TMenuItem
      Caption = 'Gerenciar Servidor'
      OnDrawItem = Im_Ger_ServDrawItem
    end
    object Im_Min: TMenuItem
      Caption = 'Minimizar'
      OnDrawItem = Im_MinDrawItem
    end
    object Im_Conf: TMenuItem
      Caption = 'Configura'#231#245'es'
      OnDrawItem = Im_ConfDrawItem
    end
    object Im_Lic: TMenuItem
      Caption = 'Licen'#231'a'
      OnDrawItem = Im_LicDrawItem
    end
    object Im_Login: TMenuItem
      Caption = 'Login'
    end
    object Im_Sair: TMenuItem
      Caption = 'Sair'
      OnClick = Im_SairClick
      OnDrawItem = Im_SairDrawItem
    end
  end
end
