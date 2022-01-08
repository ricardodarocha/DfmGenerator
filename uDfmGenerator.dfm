object GeneratorForm: TGeneratorForm
  Left = 0
  Top = 0
  Caption = 'DFM Generator from any TForm'
  ClientHeight = 361
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    635
    361)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 8
    Width = 247
    Height = 18
    Caption = 'Choose a template and click Generate'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Memo1: TMemo
    Left = 40
    Top = 104
    Width = 513
    Height = 249
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
    OnChange = Memo1Change
  end
  object Button1: TButton
    Left = 46
    Top = 67
    Width = 75
    Height = 25
    Caption = 'Generate'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 127
    Top = 67
    Width = 75
    Height = 25
    Caption = 'Save'
    Enabled = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 48
    Top = 32
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 3
    Text = 'SingleLayout'
    Items.Strings = (
      'SingleLayout'
      'ContainerLayout')
  end
  object SaveDialog: TSaveDialog
    Left = 520
    Top = 16
  end
end
