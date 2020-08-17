object frmMenu: TfrmMenu
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 317
  ClientWidth = 687
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mmMenu
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sb: TStatusBar
    Left = 0
    Top = 298
    Width = 687
    Height = 19
    Panels = <
      item
        Width = 50
      end
      item
        Text = 'Usu'#225'rio: uedercosta'
        Width = 200
      end
      item
        Text = 'Perfil: Administrador'
        Width = 250
      end
      item
        Width = 50
      end>
  end
  object mmMenu: TMainMenu
    Left = 240
    Top = 136
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Empresas1: TMenuItem
        Action = act_CadEmpresa
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Cargos1: TMenuItem
        Action = act_CadCargo
      end
      object Eventos1: TMenuItem
        Action = act_CadEvento
      end
      object Funcionrios1: TMenuItem
        Action = act_CadFuncionario
      end
    end
    object Lanamentos1: TMenuItem
      Caption = 'Lan'#231'amentos'
      object GeraoRecibos1: TMenuItem
        Action = act_GeracaoRecibos
      end
      object ImpressodosRecibos1: TMenuItem
        Action = act_ImpressaoRecibos
      end
    end
    object Utilitrios1: TMenuItem
      Caption = 'Utilit'#225'rios'
      object actCadUsuarios1: TMenuItem
        Action = act_CadUsuarios
      end
      object PerfildeAcessos1: TMenuItem
        Action = act_CadPerfil
      end
      object actAcessos1: TMenuItem
        Action = act_Acessos
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object actTrocarSenha1: TMenuItem
        Action = act_TrocarSenha
      end
      object actLogoff1: TMenuItem
        Caption = 'Trocar de Usu'#225'rio'
      end
    end
    object actSair1: TMenuItem
      Action = act_Sair
    end
  end
  object act_Sistema: TActionList
    Left = 72
    Top = 192
    object act_CadEmpresa: TAction
      Category = 'Cadastros'
      Caption = '&Empresas'
      OnExecute = act_CadEmpresaExecute
    end
    object act_CadFuncionario: TAction
      Category = 'Cadastros'
      Caption = '&Funcion'#225'rios'
      OnExecute = act_CadFuncionarioExecute
    end
    object act_CadEvento: TAction
      Category = 'Cadastros'
      Caption = 'E&ventos'
      OnExecute = act_CadEventoExecute
    end
    object act_CadCargo: TAction
      Category = 'Cadastros'
      Caption = '&Cargos'
      OnExecute = act_CadCargoExecute
    end
    object act_CadUsuarios: TAction
      Category = 'Utilit'#225'rios'
      Caption = 'Cad. de Usu'#225'rios'
    end
    object act_Acessos: TAction
      Category = 'Utilit'#225'rios'
      Caption = 'Acessos ao Sistema'
    end
    object act_TrocarSenha: TAction
      Category = 'Utilit'#225'rios'
      Caption = 'Trocar Senha'
    end
    object act_Sair: TAction
      Caption = 'S&air'
      OnExecute = act_SairExecute
    end
    object act_CadPerfil: TAction
      Category = 'Utilit'#225'rios'
      Caption = 'Perfil de Acessos'
    end
    object act_GeracaoRecibos: TAction
      Category = 'Utilit'#225'rios'
      Caption = 'Gera'#231#227'o Recibos'
    end
    object act_ImpressaoRecibos: TAction
      Category = 'Utilit'#225'rios'
      Caption = 'I&mpress'#227'o dos Recibos'
      OnExecute = act_ImpressaoRecibosExecute
    end
  end
  object EvFocusColor1: TEvFocusColor
    Color = 12582911
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    Left = 88
    Top = 56
  end
end
