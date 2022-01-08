program DfmGenerator;

uses
  Vcl.Forms,
  uDfmGenerator in 'uDfmGenerator.pas' {GeneratorForm},
  uTemplateFormatter in 'uTemplateFormatter.pas',
  ContainerLayout in 'Layouts\ContainerLayout.pas' {Form2},
  SingleLayout in 'Layouts\SingleLayout.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TGeneratorForm, GeneratorForm);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
