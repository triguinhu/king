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
        Width = 180
      end
      item
        Alignment = taCenter
        Text = 'Status: Em Funcionamento'
        Width = 50
      end>
    UseSystemFont = False
    ExplicitTop = 225
    ExplicitWidth = 539
  end
  object PM_Princ: TPopupMenu
    Left = 528
    Top = 216
    object MostrarForm1: TMenuItem
      Caption = 'Gerenciador Mobile'
    end
    object EsconderForm1: TMenuItem
      Caption = 'Minimizar'
    end
    object Sair1: TMenuItem
      Caption = 'Configura'#231#245'es'
    end
    object Animar1: TMenuItem
      Caption = 'Licen'#231'a'
    end
    object Sincronizar1: TMenuItem
      Caption = 'Sincronizar'
    end
    object estar1: TMenuItem
      Caption = 'Sair'
    end
  end
end
