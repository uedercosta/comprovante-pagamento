object frmRecibos: TfrmRecibos
  Left = 0
  Top = 0
  Caption = 'frmRecibos'
  ClientHeight = 478
  ClientWidth = 767
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = -1
    Top = 8
    Width = 794
    Height = 1123
    DataSource = ds
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 163
      BandType = btHeader
      object RLDraw1: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 84
        Align = faTop
      end
      object RLLabel1: TRLLabel
        Left = 448
        Top = 7
        Width = 252
        Height = 19
        Caption = 'Recibo de Pagamento de S'#225'lario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 11
        Top = 24
        Width = 60
        Height = 16
        Caption = 'Empresa:'
      end
      object RLLabel3: TRLLabel
        Left = 11
        Top = 43
        Width = 63
        Height = 16
        Caption = 'Endere'#231'o:'
      end
      object RLLabel4: TRLLabel
        Left = 11
        Top = 62
        Width = 64
        Height = 16
        Caption = 'CNPJ/MF:'
      end
      object RLDBText1: TRLDBText
        Left = 80
        Top = 24
        Width = 74
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 80
        Top = 43
        Width = 74
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 80
        Top = 62
        Width = 74
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 544
        Top = 62
        Width = 74
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLLabel5: TRLLabel
        Left = 544
        Top = 40
        Width = 117
        Height = 16
        Caption = 'M'#234's de Pagamento'
      end
      object RLLabel6: TRLLabel
        Left = 568
        Top = 64
        Width = 8
        Height = 16
        Caption = '/'
      end
      object RLDBText5: TRLDBText
        Left = 582
        Top = 62
        Width = 74
        Height = 16
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = ''
      end
      object RLDraw2: TRLDraw
        Left = 0
        Top = 86
        Width = 718
        Height = 48
      end
      object RLLabel7: TRLLabel
        Left = 3
        Top = 90
        Width = 44
        Height = 16
        Caption = 'C'#243'digo'
      end
      object RLLabel8: TRLLabel
        Left = 72
        Top = 90
        Width = 38
        Height = 16
        Caption = 'Nome'
      end
      object RLLabel9: TRLLabel
        Left = 376
        Top = 90
        Width = 32
        Height = 16
        Caption = 'CBO'
      end
      object RLLabel10: TRLLabel
        Left = 421
        Top = 90
        Width = 35
        Height = 16
        Caption = 'Emp.'
      end
      object RLLabel11: TRLLabel
        Left = 470
        Top = 90
        Width = 35
        Height = 16
        Caption = 'Local'
      end
      object RLLabel12: TRLLabel
        Left = 518
        Top = 90
        Width = 42
        Height = 16
        Caption = 'Depto.'
      end
      object RLLabel13: TRLLabel
        Left = 573
        Top = 90
        Width = 35
        Height = 16
        Caption = 'Setor'
      end
      object RLLabel14: TRLLabel
        Left = 622
        Top = 90
        Width = 41
        Height = 16
        Caption = 'Se'#231#227'o'
      end
      object RLLabel15: TRLLabel
        Left = 676
        Top = 90
        Width = 36
        Height = 16
        Caption = 'Folha'
      end
      object RLDraw3: TRLDraw
        Left = 0
        Top = 139
        Width = 718
        Height = 23
      end
      object RLLabel16: TRLLabel
        Left = 3
        Top = 142
        Width = 44
        Height = 16
        Caption = 'C'#243'digo'
      end
      object RLLabel18: TRLLabel
        Left = 417
        Top = 142
        Width = 65
        Height = 16
        Caption = 'Refer'#234'ncia'
      end
      object RLDraw16: TRLDraw
        Left = 605
        Top = 139
        Width = 113
        Height = 23
      end
      object RLLabel20: TRLLabel
        Left = 629
        Top = 142
        Width = 66
        Height = 16
        Caption = 'Descontos'
      end
      object RLDraw17: TRLDraw
        Left = 486
        Top = 139
        Width = 120
        Height = 23
      end
      object RLLabel19: TRLLabel
        Left = 507
        Top = 142
        Width = 80
        Height = 16
        Caption = 'Vencimentos'
      end
      object RLDraw18: TRLDraw
        Left = 66
        Top = 139
        Width = 350
        Height = 23
      end
      object RLLabel17: TRLLabel
        Left = 187
        Top = 142
        Width = 62
        Height = 16
        Caption = 'Descri'#231#227'o'
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 201
      Width = 718
      Height = 29
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 230
      Width = 718
      Height = 246
      BandType = btSummary
      object RLDraw4: TRLDraw
        Left = 0
        Top = 0
        Width = 718
        Height = 95
        Align = faTop
      end
      object RLDraw5: TRLDraw
        Left = 605
        Top = 0
        Width = 113
        Height = 48
      end
      object RLLabel21: TRLLabel
        Left = 614
        Top = 3
        Width = 96
        Height = 14
        Caption = 'Total de Descontos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDraw6: TRLDraw
        Left = 486
        Top = 0
        Width = 120
        Height = 48
      end
      object RLLabel22: TRLLabel
        Left = 493
        Top = 4
        Width = 107
        Height = 14
        Caption = 'Total de Vencimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDraw7: TRLDraw
        Left = 486
        Top = 47
        Width = 120
        Height = 48
      end
      object RLDraw8: TRLDraw
        Left = 605
        Top = 47
        Width = 113
        Height = 48
      end
      object RLMemo1: TRLMemo
        Left = 489
        Top = 62
        Width = 69
        Height = 14
        Behavior = [beSiteExpander]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Lines.Strings = (
          'Valor L'#237'quido')
        ParentFont = False
      end
      object RLDraw9: TRLDraw
        Left = 0
        Top = 95
        Width = 718
        Height = 1
        Align = faTop
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.Color = clWhite
        Brush.Style = bsClear
        DrawKind = dkCustom
      end
      object RLDraw10: TRLDraw
        Left = 0
        Top = 96
        Width = 718
        Height = 49
        Align = faTop
      end
      object RLLabel23: TRLLabel
        Left = 8
        Top = 99
        Width = 78
        Height = 16
        Caption = 'S'#225'lario Base'
      end
      object RLLabel24: TRLLabel
        Left = 104
        Top = 99
        Width = 100
        Height = 16
        Caption = 'Sal. Contr. INSS'
      end
      object RLLabel25: TRLLabel
        Left = 221
        Top = 99
        Width = 106
        Height = 16
        Caption = 'Base C'#225'lc. FGTS'
      end
      object RLLabel26: TRLLabel
        Left = 345
        Top = 99
        Width = 85
        Height = 16
        Caption = 'FGTS do M'#234's'
      end
      object RLLabel27: TRLLabel
        Left = 448
        Top = 99
        Width = 101
        Height = 16
        Caption = 'Base C'#225'lc. IRRF'
      end
      object RLLabel28: TRLLabel
        Left = 641
        Top = 99
        Width = 69
        Height = 16
        Caption = 'Faixa IRRF'
      end
      object RLDraw11: TRLDraw
        Left = 0
        Top = 145
        Width = 718
        Height = 1
        Align = faTop
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.Color = clWhite
        Brush.Style = bsClear
        DrawKind = dkCustom
      end
      object RLDraw12: TRLDraw
        Left = 0
        Top = 146
        Width = 718
        Height = 63
      end
      object RLLabel29: TRLLabel
        Left = 11
        Top = 148
        Width = 477
        Height = 15
        Caption = 
          'DECLARO TER RECEBIDO A IMPORT'#194'NCIA L'#205'QUIDA DISCRIMINADA NESTE RE' +
          'CIBO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel31: TRLLabel
        Left = 47
        Top = 193
        Width = 32
        Height = 14
        Caption = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel32: TRLLabel
        Left = 429
        Top = 192
        Width = 160
        Height = 14
        Caption = 'ASSINATURA DO FUNCION'#193'RIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDraw13: TRLDraw
        Left = 312
        Top = 186
        Width = 385
        Height = 9
        DrawKind = dkLine
      end
      object RLDraw14: TRLDraw
        Left = 8
        Top = 186
        Width = 134
        Height = 9
        DrawKind = dkLine
      end
      object RLLabel30: TRLLabel
        Left = 51
        Top = 171
        Width = 8
        Height = 18
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel33: TRLLabel
        Left = 91
        Top = 171
        Width = 8
        Height = 18
        Caption = '/'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLDraw15: TRLDraw
        Left = 559
        Top = 59
        Width = 43
        Height = 21
        DrawKind = dkArrow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
      end
    end
  end
  object ds: TDataSource
    Left = 23
    Top = 176
  end
end
