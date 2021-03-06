from random import choice

from io import BytesIO
from django.http import HttpResponse
from django.template.loader import get_template
import xhtml2pdf.pisa as pisa



class Render:

    @staticmethod
    def render(path: str, params: dict):
        template = get_template(path)
        html = template.render(params)
        response = BytesIO()
        pdf = pisa.pisaDocument(BytesIO(html.encode("UTF-8")), response)
        if not pdf.err:
            return HttpResponse(response.getvalue(), content_type='application/pdf')
        else:
            return HttpResponse("Error Rendering PDF", status=400)


def parse_policies(policies):
    """
    Turn QuestionAnswer model's policies text field contents
    into policy-party dict
    :return: policy-party dict
    """
    if not(isinstance(policies, str) and policies):
        return {"":""}

    policy_list = policies.split('\n\n')
    policy_party = {}

    for policy in policy_list:
        pair = policy.split('{')
        if len(pair) == 2:
            if '}' in pair[1]:
                pair[1] = pair[1].replace('}','')
            policy_party[pair[0]] = pair[1]
        else:
            print("odd:", pair)
    return policy_party

def select_random(policy_party):
    if not(policy_party):
        return "none", "none"
    policy, party = choice(list(policy_party.items()))
    return policy, party


#
# policies = "Земля сільськогосподарського призначення має бути визнана національним надбанням України. Мораторій на продаж сільськогосподарських земель має бути продовжений, а орендні відносини переглянуті в інтересах громадян-власників земельних паїв з урахуванням реальних ринкових ставок. {УКРОП} Партія послідовно виступає проти продажу сільськогосподарської зем­лі. Ми пропонуємо провести наступну земельну реформу: земельні паї у селян, які бажають їх продати, буде викупляти лише держава, пара­лельно буде підвищено орендну плату за земельні паї' мінімум до 5% їх реальної вартості. {Батьківщина} Ми заборонимо продаж землі і ліквідуємо нелегальний земельний ринок, на якому збагачуються товстосуми та спекулянти. Запровадимо право оренди землі під жорстким контролем держави. Заборонимо іноземцям розпоряджатися нашими чорноземами. {Радикальна партія} Земля в Україні повинна належати тим, хто її обробляє. Збереження мораторію на продаж землі сільськогосподарського призначення доти, допоки не будуть створені умови для запровадження ринку (зниження рівня корупції, необхідна інфраструктура, жорсткий контроль над використанням). {Відродження} Запровадження дієвого інституту довгострокової оренди земель сільськогосподарського призначення з можливістю застави для отримання кредиту та передачі права оренди у спадок нащадкам. {Громадянська позиція} Заборонити в Україні торгівлю землею сільськогосподарського призначення. Надавати її у довгострокове володіння українським громадянам із правом родинного успадкування. Визначити законом підстави припинення такого володіння в разі використання сільськогосподарських земель за нецільовим призначенням або в разі погіршення стану (родючості) ґрунтів. {Свобода} Мораторій на купівлю та продаж земель сільськогосподарського призначення має бути подовжений до завершення україно-російської війни та подолання наслідків економічної кризи. {Національний корпус}"
#
# parse_policies(policies)

