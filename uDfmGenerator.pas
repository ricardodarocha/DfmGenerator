unit uDfmGenerator;

interface

uses

  {$REGION 'Win'}
  Winapi.Windows,
  Winapi.Messages,
  {$ENDREGION}
  {$REGION'System'}
  System.SysUtils,
  System.Variants,
  System.Classes,
  {$ENDREGION}
  {$REGION 'Vcl'}
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  uTemplateFormatter,
  {$ENDREGION}
  {$REGION 'Layouts'}
  SingleLayout,
  ContainerLayout
  {$ENDREGION}
  {$REGION 'Third Part Components'}
  {,
  SynEditHighlighter, SynHighlighterPas, SynEdit};
  {$ENDREGION}

type
  TGeneratorForm = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    SaveDialog: TSaveDialog;
    ComboBox1: TComboBox;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GeneratorForm: TGeneratorForm;

implementation

{$R *.dfm}

procedure TGeneratorForm.Memo1Change(Sender: TObject);
begin
//  SynEdit1.Lines.Text := Memo1.Lines.Text;
end;

procedure TGeneratorForm.Button1Click(Sender: TObject);
begin
  Button2.Enabled := true;
  Memo1.Lines.Clear;
  if combobox1.itemindex = 0 then
    TTemplateFormatter.ExportarObjetos(Form1, Memo1.Lines)

  else if combobox1.itemindex = 1 then
    TTemplateFormatter.ExportarObjetos(Form2, Memo1.Lines);

  Label1.Caption := 'Generated from ' + combobox1.Text;
end;

procedure TGeneratorForm.Button2Click(Sender: TObject);
begin
  if Memo1.Lines.Text <> 'Memo1' then
    if SaveDialog.Execute then
      Memo1.Lines.SaveToFile(SaveDialog.FileName);
end;

end.
