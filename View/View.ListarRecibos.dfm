inherited frmListaRecibos: TfrmListaRecibos
  Caption = 'Lista de Recibos Gerados'
  ClientWidth = 695
  ExplicitWidth = 701
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 695
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 699
    DesignSize = (
      695
      57)
    object GroupBox1: TGroupBox
      Left = 8
      Top = 0
      Width = 145
      Height = 49
      Caption = 'Buscar nos Meses'
      TabOrder = 0
    end
    object GroupBox2: TGroupBox
      Left = 159
      Top = 0
      Width = 90
      Height = 49
      Caption = 'Ano'
      TabOrder = 1
      object edAno: TJvSpinEdit
        Left = 10
        Top = 16
        Width = 71
        Height = 22
        MinValue = 2015.000000000000000000
        Value = 2015.000000000000000000
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 255
      Top = 0
      Width = 322
      Height = 49
      Caption = 'Nome do Funcion'#225'rio'
      TabOrder = 2
      DesignSize = (
        322
        49)
      object Edit1: TEdit
        Left = 8
        Top = 16
        Width = 305
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = 'Edit1'
      end
    end
    object BitBtn1: TBitBtn
      Left = 583
      Top = 6
      Width = 106
      Height = 43
      Anchors = [akTop, akRight]
      Caption = 'BitBtn1'
      TabOrder = 3
    end
  end
  object dbGrid: TJvDBGrid [1]
    Left = 0
    Top = 57
    Width = 695
    Height = 120
    Align = alTop
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    SelectColumnsDialogStrings.Caption = 'Select columns'
    SelectColumnsDialogStrings.OK = '&OK'
    SelectColumnsDialogStrings.NoSelectionWarning = 'At least one column must be visible!'
    EditControls = <>
    RowsHeight = 18
    TitleRowHeight = 18
  end
  inherited EnterTab: TACBrEnterTab
    Left = 432
    Top = 128
  end
end
