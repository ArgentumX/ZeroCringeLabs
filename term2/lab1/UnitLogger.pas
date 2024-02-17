unit UnitLogger;

interface

var
  fout: TextFile;

procedure Log(comment: string; content: string);

implementation

procedure Log(comment: string; content: string);
begin
  writeln(fout, comment, content);
end;

initialization
  AssignFile(fout, 'log.txt');
  Rewrite(fout);

finalization
  CloseFile(fout);

end.