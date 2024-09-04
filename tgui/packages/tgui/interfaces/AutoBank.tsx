import { useBackend } from '../backend';
import {
  AnimatedNumber,
  LabeledList,
  NoticeBox,
  NumberInput,
  Section,
} from '../components';
import { formatMoney } from '../format';
import { Window } from '../layouts';

type Data = {
  current_balance: number;
  withdrawal_amount: number;
  totalcreds: number;
};

export const AutoBank = (props) => {
  const { act, data } = useBackend<Data>();
  const { current_balance, withdrawal_amount } = data;

  return (
    <Window width={350} height={155}>
      <Window.Content>
        <NoticeBox danger>
          Connected to Massestimme::SRN. Input your ID card to start banking.
        </NoticeBox>
        <Section title={'Massestimme Automated Teller Machine'}>
          <LabeledList>
            <LabeledList.Item
              label="CURRENT BALANCE"
              buttons={
                <NumberInput
                  value={0}
                  minValue={0}
                  maxValue={100000}
                  step={1}
                  onChange={(value) =>
                    act('withdraw', {
                      totalcreds: value,
                    })
                  }
                />
              }
            >
              <AnimatedNumber
                value={current_balance}
                format={(value) => formatMoney(value)}
              />
              {' cr'}
            </LabeledList.Item>
          </LabeledList>
        </Section>
      </Window.Content>
    </Window>
  );
};
