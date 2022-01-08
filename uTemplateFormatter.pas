unit uTemplateFormatter;

interface

uses
  System.Classes,
  Vcl.Forms,
  Vcl.Controls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Graphics;

type
  TTemplateFormatter = class
    class procedure ExportarObjetos(ASender: TWinControl; ALines: TStrings);
  private
    {Owner}
    class procedure ExportForm(AForm: TForm; ALines: TStrings);
    class procedure ExportPanel(APanel: TPanel; ALines: TStrings);

    {Mediator}
    class procedure ExportControl(AControl: TControl; ALines: TStrings);
    class procedure ExportWinControl(AWinControl: TWinControl; ALines: TStrings);

    {Components}
    class procedure ExportLabel(ALabel: TLabel; ALines: TStrings);
    class procedure ExportEdit(AEdit: TEdit; ALines: TStrings);
    class procedure ExportButton(AButton: TButton; ALines: TStrings);
  end;

implementation

uses
  System.SysUtils;

class procedure TTemplateFormatter.ExportarObjetos(ASender: TWinControl; ALines: TStrings);
var
  Component: Integer;
begin
  if ASender is TPanel then
    TTEmplateFormatter.ExportPanel(TPanel(ASender), ALines)

  else if ASender is TForm then
    TTEmplateFormatter.ExportForm(TForm(ASender), ALines);


  if ASender.ComponentCount > 0 then
  for Component  := 0 to ASender.ComponentCount -1 do
  begin
    if TWinControl(ASender.Components[Component]).Parent.Name <> ASender.Name then
      continue;

    if ASender.Components[Component]  is TWinControl then
      ExportWinControl(TWinControl( ASender.Components[Component] ), ALines)

    else if ASender.Components[Component]  is TControl then
      ExportControl(TControl( ASender.Components[Component] ), ALines);

  end  else
  for Component  := 0 to ASender.Owner.ComponentCount -1 do
  begin
    if TWinControl(ASender.Owner.Components[Component]).Parent.Name  <> ASender.Name then
      continue;

    if ASender.Owner.Components[Component]  is TWinControl then
      ExportWinControl(TWinControl( ASender.Owner.Components[Component] ), ALines)

    else if ASender.Owner.Components[Component]  is TControl then
      ExportControl(TControl( ASender.Owner.Components[Component] ), ALines);
  end;

  ALines.add(format('  end', []));
end;

class procedure TTemplateFormatter.ExportControl(AControl: TControl; ALines: TStrings);
begin
  if AControl is TLabel then
    TTEmplateFormatter.ExportLabel(TLabel(AControl), ALines);
end;

class procedure TTemplateFormatter.ExportWinControl(AWinControl: TWinControl; ALines: TStrings);
begin
  if AWinControl is TEdit then
    TTEmplateFormatter.ExportEdit(TEdit(AWinControl), ALines)
  else
  if AWinControl is TButton then
    TTEmplateFormatter.ExportButton(TButton(AWinControl), ALines)
  else if AWinControl is Tpanel then
    TTemplateFormatter.ExportarObjetos(TPanel(AWinControl), ALines);
end;

class procedure TTemplateFormatter.ExportForm(AForm: TForm; ALines: TStrings);
begin
  ALines.add(format('object %:0s: T%:0s', [AForm.Name]));
  ALines.add(format('  Left = 0', []));
  ALines.add(format('  Top = 0', []));
  ALines.add(format('  Caption = ''%s''', [AForm.Caption]));
  ALines.add(format('  ClientHeight = %d', [AForm.ClientHeight]));
  ALines.add(format('  ClientWidth = %d', [AForm.ClientWidth]));
  ALines.add(format('  Color = clBtnFace', []));
  ALines.add(format('  Font.Charset = DEFAULT_CHARSET', []));
  ALines.add(format('  Font.Color = clWindowText', []));
  ALines.add(format('  Font.Height = %d', [AForm.Font.Height]));
  ALines.add(format('  Font.Name = ''%s''', [AForm.Font.Name]));
  ALines.add(format('  Font.Style = []', []));
  ALines.add(format('  OldCreateOrder = False ', []));
  ALines.add(format('  PixelsPerInch = %d', [AForm.PixelsPerInch]));
  ALines.add(format('  TextHeight = 13', []));
end;

class procedure TTemplateFormatter.ExportLabel(ALabel: TLabel; ALines: TStrings);
begin
  ALines.add(format('  object %s: %s', [ALabel.Name, ALabel.ClassName]));
  ALines.add(format('    Left = %d', [ALabel.Left]));
  ALines.add(format('    Top = %d', [ALabel.Top]));
  ALines.add(format('    Width = %d', [ALabel.Width]));
  ALines.add(format('    Height = %d', [ALabel.Height]));
  ALines.add(format('    Caption = ''%s''', [ALabel.Caption]));

  if Not ALabel.ParentFont then
  begin
    ALines.add(format('    Font.Charset = DEFAULT_CHARSET', []));
    ALines.add(format('    Font.Color = clWindowText', []));
    ALines.add(format('    Font.Height = %d', [ALabel.Font.Height]));
    ALines.add(format('    Font.Name = ''%s', [ALabel.Font.Name]));
    ALines.add(format('    Font.Style = []', []));
    ALines.add(format('    ParentFont = False', []));
  end;
  ALines.add(format('  end', []));
end;

class procedure TTemplateFormatter.ExportEdit(AEdit: TEdit; ALines: TStrings);
begin
  ALines.add(format('  object %s: %s', [AEdit.Name, AEdit.ClassName]));
  ALines.add(format('    Left = %d', [AEdit.Left]));
  ALines.add(format('    Top = %d', [AEdit.Top]));
  ALines.add(format('    Width = %d', [AEdit.Width]));
  ALines.add(format('    Height = %d', [AEdit.Height]));
  ALines.add(format('    TabOrder = %d', [AEdit.TabOrder]));
  ALines.add(format('    Text = ''%s''', [AEdit.Text]));
  ALines.add(format('  end', []));
end;

class procedure TTemplateFormatter.ExportButton(AButton: TButton; ALines: TStrings);
begin
  ALines.add(format('  object %s: %s', [AButton.Name, AButton.ClassName]));
  ALines.add(format('    Left = %d', [AButton.Left]));
  ALines.add(format('    Top = %d', [AButton.Top]));
  ALines.add(format('    Width = %d', [AButton.Width]));
  ALines.add(format('    Height = %d', [AButton.Height]));
  ALines.add(format('    Caption = ''%s''', [AButton.Caption]));
  ALines.add(format('    TabOrder = %d', [AButton.TabOrder]));
  ALines.add(format('  end', []));
end;

class procedure TTemplateFormatter.ExportPanel(APanel: TPanel; ALines: TStrings);
begin
  ALines.add(format('  object %s: %s', [APanel.Name, APanel.ClassName]));
  ALines.add(format('    Left = %d', [APanel.Left]));
  ALines.add(format('    Top = %d', [APanel.Top]));
  ALines.add(format('    Width = %d', [APanel.Width]));
  case APanel.Align of
    alNone:   ALines.add(format('    Align = alNone', []));
    alTop:    ALines.add(format('    Align = alTop', []));
    alBottom: ALines.add(format('    Align = alBottom', []));
    alLeft:   ALines.add(format('    Align = alLeft', []));
    alRight:  ALines.add(format('    Align = alRight', []));
    alClient: ALines.add(format('    Align = alClient', []));
    alCustom: ALines.add(format('    Align = alCustom', []));
  end;
  ALines.add(format('    Height = %d', [APanel.Height]));
  ALines.add(format('    Caption = ''%s''', [APanel.Caption]));
  ALines.add(format('    TabOrder = %d', [APanel.TabOrder]));
end;

end.
