object DM: TDM
  OldCreateOrder = False
  Height = 396
  Width = 579
  object con: TFDConnection
    Params.Strings = (
      'Database=C:\dev\Delphi\Comprovante Pagamento Salarial\DB.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'Server=localhost'
      'Port=3060'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 152
    Top = 24
  end
  object FBDriver: TFDPhysFBDriverLink
    VendorLib = 'C:\Program Files (x86)\Firebird\Firebird_3_0\fbclient.dll'
    Left = 96
    Top = 24
  end
  object QryEmpresas: TFDQuery
    CachedUpdates = True
    Connection = con
    SQL.Strings = (
      'SELECT * FROM EMPRESAS')
    Left = 32
    Top = 104
    object QryEmpresasID_EMPRESA: TLargeintField
      DisplayLabel = 'Id. Empresa'
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '000000'
    end
    object QryEmpresasNOME: TStringField
      DisplayLabel = 'Nome Empresa'
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 80
    end
    object QryEmpresasENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Required = True
      Size = 40
    end
    object QryEmpresasNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 5
    end
    object QryEmpresasBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Required = True
      Size = 40
    end
    object QryEmpresasCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Required = True
      EditMask = '00.000.000/0000-00'
      Size = 18
    end
  end
  object QryCargos: TFDQuery
    CachedUpdates = True
    Connection = con
    SQL.Strings = (
      'SELECT * FROM CARGOS')
    Left = 120
    Top = 104
    object QryCargosID_CARGO: TLargeintField
      DisplayLabel = 'Id. Cargo'
      FieldName = 'ID_CARGO'
      Origin = 'ID_CARGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '000000'
    end
    object QryCargosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object QryCargosID_EMPRESA: TLargeintField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
      Required = True
    end
  end
  object QryEventos: TFDQuery
    CachedUpdates = True
    Connection = con
    SQL.Strings = (
      'SELECT * FROM EVENTOS')
    Left = 200
    Top = 104
    object QryEventosID_EVENTO: TLargeintField
      DisplayLabel = 'Id. Evento'
      FieldName = 'ID_EVENTO'
      Origin = 'ID_EVENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '000'
    end
    object QryEventosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 60
    end
    object QryEventosDESCONTOS: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'DESCONTOS'
      Origin = 'DESCONTOS'
      Required = True
    end
    object QryEventosID_EMPRESA: TLargeintField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
      Required = True
    end
  end
  object QryFuncionarios: TFDQuery
    CachedUpdates = True
    Connection = con
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIOS')
    Left = 280
    Top = 104
    object QryFuncionariosID_FUNC: TLargeintField
      DisplayLabel = 'Id. Func.'
      FieldName = 'ID_FUNC'
      Origin = 'ID_FUNC'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '000000'
    end
    object QryFuncionariosID_EMPRESA: TLargeintField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
      Required = True
    end
    object QryFuncionariosNOME: TStringField
      DisplayLabel = 'Nome '
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 80
    end
    object QryFuncionariosID_CARGO: TLargeintField
      DisplayLabel = 'Id. Cargo'
      FieldName = 'ID_CARGO'
      Origin = 'ID_CARGO'
      Required = True
      DisplayFormat = '000000'
    end
    object QryFuncionariosCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      EditMask = '000.000.000-00'
      Size = 18
    end
    object QryFuncionariosRG: TStringField
      DisplayLabel = 'R.G.'
      FieldName = 'RG'
      Origin = 'RG'
      Required = True
      Size = 18
    end
    object QryFuncionariosDATA_ADMISSAO: TDateField
      DisplayLabel = 'Data Admiss'#227'o'
      FieldName = 'DATA_ADMISSAO'
      Origin = 'DATA_ADMISSAO'
      Required = True
    end
    object QryFuncionariosOBSERVACAOES: TStringField
      DisplayLabel = 'Observa'#231#245'es'
      FieldName = 'OBSERVACAOES'
      Origin = 'OBSERVACAOES'
      Size = 3000
    end
    object QryFuncionariosSALARIO: TFMTBCDField
      DisplayLabel = 'S'#225'lario'
      FieldName = 'SALARIO'
      Origin = 'SALARIO'
      Required = True
      currency = True
      Precision = 18
      Size = 5
    end
  end
  object QryRecibos: TFDQuery
    CachedUpdates = True
    Connection = con
    SQL.Strings = (
      'SELECT * FROM RECIBOS')
    Left = 368
    Top = 104
    object QryRecibosID_RECIBO: TLargeintField
      FieldName = 'ID_RECIBO'
      Origin = 'ID_RECIBO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryRecibosID_EMPRESA: TLargeintField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
    end
    object QryRecibosID_FUNC: TLargeintField
      DisplayLabel = 'Id. Func.'
      FieldName = 'ID_FUNC'
      Origin = 'ID_FUNC'
      DisplayFormat = '000000'
    end
    object QryRecibosMES: TIntegerField
      DisplayLabel = 'M'#234's'
      FieldName = 'MES'
      Origin = 'MES'
    end
    object QryRecibosANO: TIntegerField
      DisplayLabel = 'Ano'
      FieldName = 'ANO'
      Origin = 'ANO'
      DisplayFormat = '0000'
    end
    object QryRecibosTOTAL_VENCIMENTOS: TFMTBCDField
      DisplayLabel = 'Total de Vencimentos'
      FieldName = 'TOTAL_VENCIMENTOS'
      Origin = 'TOTAL_VENCIMENTOS'
      currency = True
      Precision = 18
      Size = 5
    end
    object QryRecibosTOTAL_LIQUIDO: TFMTBCDField
      DisplayLabel = 'Total Liquido'
      FieldName = 'TOTAL_LIQUIDO'
      Origin = 'TOTAL_LIQUIDO'
      currency = True
      Precision = 18
      Size = 5
    end
    object QryRecibosTOTAL_DESCONTOS: TFMTBCDField
      DisplayLabel = 'Total Descontos'
      FieldName = 'TOTAL_DESCONTOS'
      Origin = 'TOTAL_DESCONTOS'
      currency = True
      Precision = 18
      Size = 5
    end
    object QryRecibosSALARIO_BASE: TFMTBCDField
      DisplayLabel = 'S'#225'lario Base'
      FieldName = 'SALARIO_BASE'
      Origin = 'SALARIO_BASE'
      currency = True
      Precision = 18
      Size = 5
    end
    object QryRecibosSALARIO_CONTR_INSS: TFMTBCDField
      DisplayLabel = 'S'#225'l. Contrib. INSS'
      FieldName = 'SALARIO_CONTR_INSS'
      Origin = 'SALARIO_CONTR_INSS'
      currency = True
      Precision = 18
      Size = 5
    end
    object QryRecibosBASE_FGTS: TFMTBCDField
      DisplayLabel = 'Base FGTS'
      FieldName = 'BASE_FGTS'
      Origin = 'BASE_FGTS'
      currency = True
      Precision = 18
      Size = 5
    end
    object QryRecibosFGTS: TFMTBCDField
      FieldName = 'FGTS'
      Origin = 'FGTS'
      currency = True
      Precision = 18
      Size = 5
    end
    object QryRecibosBASE_CALC_IRRF: TFMTBCDField
      DisplayLabel = 'Bas. C'#225'lc. IRRF'
      FieldName = 'BASE_CALC_IRRF'
      Origin = 'BASE_CALC_IRRF'
      currency = True
      Precision = 18
      Size = 5
    end
    object QryRecibosFAIXA_IRRF: TFMTBCDField
      DisplayLabel = 'Faixa IRRF'
      FieldName = 'FAIXA_IRRF'
      Origin = 'FAIXA_IRRF'
      Precision = 18
      Size = 5
    end
  end
end
