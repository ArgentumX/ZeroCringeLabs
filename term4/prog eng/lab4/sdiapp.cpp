//---------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#include <tchar.h>
//---------------------------------------------------------------------
USEFORM("UnitAnswer.cpp", FormAnswer);
USEFORM("UnitInput.cpp", DataInput);
USEFORM("SDIMAIN.CPP", SDIAppForm);
USEFORM("ABOUT.CPP", AboutBox);
USEFORM("OKCANCL2.cpp", OKRightDlg);
USEFORM("UnitEdit.cpp", FormEdit); // Исправлено с TFormEdit на FormEdit
//---------------------------------------------------------------------------
int WINAPI _tWinMain(HINSTANCE, HINSTANCE, LPTSTR, int)
{
    Application->Initialize();
    Application->CreateForm(__classid(TSDIAppForm), &SDIAppForm);
    Application->CreateForm(__classid(TAboutBox), &AboutBox);
    Application->CreateForm(__classid(TDataInput), &DataInput);
    Application->CreateForm(__classid(TOKRightDlg), &OKRightDlg);
    Application->CreateForm(__classid(TFormAnswer), &FormAnswer);
    Application->CreateForm(__classid(TFormEdit), &FormEdit);
    Application->Run();

    return 0;
}
//---------------------------------------------------------------------
