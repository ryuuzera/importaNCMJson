object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 10
  AlphaBlend = True
  AlphaBlendValue = 252
  BorderStyle = bsNone
  Caption = 'frmPrincipal'
  ClientHeight = 685
  ClientWidth = 875
  Color = 789516
  TransparentColor = True
  TransparentColorValue = 16579836
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  GlassFrame.Top = 5
  OldCreateOrder = False
  Position = poScreenCenter
  StyleElements = []
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel5: TPanel
    AlignWithMargins = True
    Left = 2
    Top = 2
    Width = 871
    Height = 681
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel5'
    Color = 3289650
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    ExplicitLeft = 104
    ExplicitTop = 296
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 871
      Height = 33
      Align = alTop
      Anchors = [akLeft, akRight]
      BevelOuter = bvNone
      Caption = 'Panel1'
      Color = 789516
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      OnMouseDown = Panel1MouseDown
      ExplicitWidth = 875
      object imgClose: TImage
        Left = 839
        Top = 0
        Width = 32
        Height = 33
        Cursor = crHandPoint
        Align = alRight
        Center = True
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D494844520000000C
          0000000C100600000006E580A40000000467414D410000B18F0BFC6105000000
          206348524D00007A26000080840000FA00000080E8000075300000EA6000003A
          98000017709CBA513C000000097048597300000EC300000EC301C76FA8640000
          0002624B47440000AA8D23320000000774494D4507E604080B35108F2EE12300
          00002574455874646174653A63726561746500323032322D30342D3038543131
          3A35333A31362B30303A3030CD3427C90000002574455874646174653A6D6F64
          69667900323032322D30342D30385431313A35333A31362B30303A3030BC699F
          75000000E249444154384F9592410AC23010455B8FA00B45F0226EC423B8513C
          8DD01B684B558287D13348457A932EAC69FE9FA22961DA97C5679299F9493B51
          ED78EDA0A771FD69561C470391BAB68FA32868906FA1828D51B0667D10E44777
          68F6840A97993827D8B8EEA1C2791A32C2B9344E53A8C5E5DF16AC7B30BD7DA2
          6A847840631F2688D11B2AE43934CBA082316A631FCFC87B91C59DEB371E51BB
          C4CDAA5708AA25F407775E558C0E541D5C2F3415A684763E9D3E7548D47F1EB5
          FFD4E160F854705F37C2C6710315FA4F05F30253974E68501A68EB9CB0BE37FF
          46B68FA39C7F0107BB7C6879C2E78A0000000049454E44AE426082}
        OnClick = imgCloseClick
        ExplicitLeft = 712
        ExplicitHeight = 25
      end
      object imgMinimize: TImage
        Left = 807
        Top = 0
        Width = 32
        Height = 33
        Cursor = crHandPoint
        Align = alRight
        Center = True
        Picture.Data = {
          0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000018
          0000001810040000001AEE29300000000467414D410000B18F0BFC6105000000
          206348524D00007A26000080840000FA00000080E8000075300000EA6000003A
          98000017709CBA513C00000002624B47440000AA8D2332000000097048597300
          0000600000006000F06B42CF0000000774494D4507E604080B3425C086144100
          0000494944415448C763601805A360148C0282801199F3FF9F880803E3BC790C
          FF3939C933EDFB7786FFC9C98C4CAF5FC384985015FCFBC7C0F0E70F654EFEF7
          6FC0826B148C8251305401005FEC0FF6E81D58FA000000257445587464617465
          3A63726561746500323032322D30342D30385431313A35323A33372B30303A30
          30C6A4403E0000002574455874646174653A6D6F6469667900323032322D3034
          2D30385431313A35323A33372B30303A3030B7F9F8820000000049454E44AE42
          6082}
        OnClick = imgMinimizeClick
        ExplicitLeft = 712
        ExplicitHeight = 25
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 33
      Width = 871
      Height = 648
      Align = alClient
      Anchors = []
      BevelOuter = bvNone
      Caption = 'Panel1'
      Color = 3289650
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
      ExplicitTop = 0
      ExplicitWidth = 875
      ExplicitHeight = 685
      object Panel3: TPanel
        Left = 208
        Top = 0
        Width = 663
        Height = 648
        Align = alRight
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvNone
        Caption = 'Panel1'
        Color = 2960685
        ParentBackground = False
        ShowCaption = False
        TabOrder = 0
        ExplicitWidth = 667
        ExplicitHeight = 685
        object RichEdit: TRichEdit
          Left = 0
          Top = 29
          Width = 663
          Height = 619
          Align = alClient
          BorderStyle = bsNone
          Color = 3288877
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Consolas'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
          Zoom = 100
          ExplicitWidth = 667
          ExplicitHeight = 656
        end
        object PN_EVENTOS: TPanel
          Tag = 25
          Left = 616
          Top = 598
          Width = 49
          Height = 41
          Caption = 'PN_EVENTOS'
          TabOrder = 1
          Visible = False
          OnMouseLeave = PN_EVENTOSMouseLeave
          OnMouseMove = PN_EVENTOSMouseMove
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 663
          Height = 29
          Align = alTop
          Anchors = [akLeft, akRight]
          BevelOuter = bvNone
          Caption = 'Panel4'
          ShowCaption = False
          TabOrder = 2
          ExplicitWidth = 667
          object lbStatus: TLabel
            Left = 9
            Top = 6
            Width = 4
            Height = 16
            Alignment = taCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 11104377
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
        end
      end
      object frmPrincipal: TPanel
        Left = 0
        Top = 0
        Width = 202
        Height = 648
        Align = alLeft
        Anchors = [akBottom]
        BevelOuter = bvNone
        Caption = 'frmPrincipal'
        ShowCaption = False
        TabOrder = 1
        ExplicitHeight = 685
        object btGeraCodigo: TPanel
          Tag = 10
          AlignWithMargins = True
          Left = 0
          Top = 87
          Width = 202
          Height = 41
          Margins.Left = 0
          Margins.Top = 1
          Margins.Right = 0
          Margins.Bottom = 1
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Gerar C'#243'digo Delphi'
          Color = 11104377
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          OnClick = btGeraCodigoClick
          ExplicitTop = 43
        end
        object btImportaJson: TPanel
          Tag = 10
          AlignWithMargins = True
          Left = 0
          Top = 44
          Width = 202
          Height = 41
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 1
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Importar JSON'
          Color = 5783877
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Segoe UI Semibold'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          OnClick = btImportaJsonClick
          ExplicitTop = 1
        end
        object btComoUtilizar: TPanel
          Tag = 10
          AlignWithMargins = True
          Left = 0
          Top = 2
          Width = 202
          Height = 41
          Margins.Left = 0
          Margins.Top = 2
          Margins.Right = 0
          Margins.Bottom = 1
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Como Utilizar'
          Color = 11104377
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 2
          OnClick = btComoUtilizarClick
          ExplicitLeft = 3
          ExplicitTop = 0
        end
      end
    end
  end
end
