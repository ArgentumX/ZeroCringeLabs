//----------------------------------------------------------------------------
#ifndef SDIMainH
#define SDIMainH
//----------------------------------------------------------------------------
#include <Vcl.ComCtrls.hpp>
#include <Vcl.ExtCtrls.hpp>
#include <Vcl.Buttons.hpp>
#include <Vcl.StdCtrls.hpp>
#include <Vcl.Dialogs.hpp>
#include <Vcl.Menus.hpp>
#include <Vcl.Controls.hpp>
#include <Vcl.Forms.hpp>
#include <Vcl.Graphics.hpp>
#include <System.Classes.hpp>
#include <Winapi.Windows.hpp>
#include <System.hpp>
#include <Vcl.ActnList.hpp>
#include <Vcl.ImgList.hpp>
#include <Vcl.StdActns.hpp>
#include <Vcl.ToolWin.hpp>
#include <System.Actions.hpp>
#include <System.ImageList.hpp>

#include "About.h"
#include "UnitInput.h"
#include "UnitTask.h"
#include "OKCANCL2.h"
#include "UnitAnswer.h"
//----------------------------------------------------------------------------
class TSDIAppForm : public TForm
{
__published:
    TStatusBar *StatusBar;
    TMainMenu *MainMenu1;
    TMenuItem *File1;
    TMenuItem *Exit1;
    TMenuItem *Wnd;
    TMenuItem *InputData;
    TMenuItem *Solvation;
    TMenuItem *Help;
    TMenuItem *About;
    TMenuItem *EditData;
    void __fastcall Exit1Click(TObject *Sender);
    void __fastcall AboutClick(TObject *Sender);
    //void __fastcall ModeClick(TObject *Sender);
    void __fastcall InputDataClick(TObject *Sender);
    void __fastcall SolvationClick(TObject *Sender);
    void __fastcall EditDataClick(TObject *Sender); // �������� ����������
private:
public:
    virtual __fastcall TSDIAppForm(TComponent *AOwner);
};
//----------------------------------------------------------------------------
extern TSDIAppForm *SDIAppForm;
//----------------------------------------------------------------------------
#endif
