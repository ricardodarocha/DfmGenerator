object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'A layout with multilevel components inside of components,'
  ClientHeight = 270
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 455
    Height = 161
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 422
    object Label1: TLabel
      Left = 80
      Top = 88
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 80
      Top = 14
      Width = 39
      Height = 18
      Caption = 'Login'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 80
      Top = 115
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
    object Edit1: TEdit
      Left = 152
      Top = 85
      Width = 121
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 152
      Top = 112
      Width = 121
      Height = 21
      TabOrder = 1
      Text = 'Edit1'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 455
    Height = 41
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 422
  end
  object Panel3: TPanel
    Left = 0
    Top = 202
    Width = 455
    Height = 68
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 422
    object Button1: TButton
      Left = 304
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 223
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
    end
  end
end
