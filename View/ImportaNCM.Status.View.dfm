object frmStatus: TfrmStatus
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Importador NCM'
  ClientHeight = 129
  ClientWidth = 469
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 469
    Height = 129
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    Color = 3289650
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    ExplicitHeight = 168
    object Gauge: TGauge
      AlignWithMargins = True
      Left = 0
      Top = 85
      Width = 469
      Height = 44
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alBottom
      ForeColor = 5783877
      Progress = 0
      ExplicitLeft = -8
      ExplicitTop = 143
      ExplicitWidth = 467
    end
    object lbStatus: TLabel
      Left = 8
      Top = 64
      Width = 49
      Height = 17
      Caption = 'lbStatus'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
    end
  end
end
