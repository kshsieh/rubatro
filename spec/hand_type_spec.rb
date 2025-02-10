require "spec_helper"

RSpec.describe HandType do
  # TODO: test other hands programatically?
  context ":full_house" do
    subject { described_class.new(:full_house) }

    describe "#chips" do
      context "base" do
        it "should return default chips" do
          expect(subject.chips).to eq(40)
        end
      end

      context "scaling" do
        context "level 2" do
          before do
            subject.level = 2
          end

          it "returns the appropriately scaled number of chips" do
            expect(subject.chips).to eq(65)
          end
        end

        context "level 5" do
          before do
            subject.level = 5
          end

          it "returns the appropriately scaled number of chips" do
            expect(subject.chips).to eq(140)
          end
        end
      end
    end

    describe "mult" do
      context "base" do
        it "should return default mult" do
          expect(subject.mult).to eq(4)
        end
      end

      context "scaling" do
        context "level 2" do
          before do
            subject.level = 2
          end

          it "returns the appropriately scaled amount of mult" do
            expect(subject.mult).to eq(6)
          end
        end

        context "level 5" do
          before do
            subject.level = 5
          end

          it "returns the appropriately scaled amount of mult" do
            expect(subject.mult).to eq(12)
          end
        end
      end
    end
  end
end
