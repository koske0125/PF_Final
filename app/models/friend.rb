class Friend < ApplicationRecord
  belongs_to :user

  enum rank: { unrank: 0, iron: 1, bronze: 2, silver: 3, gold: 4, platinum: 5, diamond: 6, master: 7, grandmaster: 8, challenger: 9 }, _prefix: true
  enum vc_status: { unavailable: 0, listening_only: 1, available: 2 }, _prefix: true

  validates :introduction, :active_time, presence: true
  validates :introduction, length: { maximum: 500 }

  scope :search, -> (search_params) do
    return if search_params.blank? #search_paramsがなければ以下の処理は実行しない
      rank(search_params[:rank])
      .is_rank(search_params[:is_rank])
      .is_normal(search_params[:is_normal])
      .is_beginner(search_params[:is_beginner])
      .is_coaching(search_params[:is_coaching])
      .is_coached(search_params[:is_coached])
      .is_clash(search_params[:is_clash])
      .good_at_top(search_params[:good_at_top])
      .good_at_jg(search_params[:good_at_jg])
      .good_at_mid(search_params[:good_at_mid])
      .good_at_adc(search_params[:good_at_adc])
      .good_at_sup(search_params[:good_at_sup])
      .bad_at_top(search_params[:bad_at_top])
      .bad_at_jg(search_params[:bad_at_jg])
      .bad_at_mid(search_params[:bad_at_mid])
      .bad_at_adc(search_params[:bad_at_adc])
      .bad_at_sup(search_params[:bad_at_sup])
      .vc_status(search_params[:vc_status])
      .vc_discord(search_params[:vc_discord])
      .vc_skype(search_params[:vc_skype])
      .vc_leaguevoice(search_params[:vc_leaguevoice])
      .sort_status(search_params[:sort_status])
  end

  scope :rank, -> (rank) { where(rank: rank) if rank.present? }
  scope :is_rank, -> (is_rank) { where(is_rank: true) if is_rank.present? && is_rank == 1 }
  scope :is_normal, -> (is_normal) { where(is_normal: true) if is_normal.present? && is_normal == 1 }
  scope :is_beginner, -> (is_beginner) { where(is_beginner: true) if is_beginner.present? && is_beginner == 1 }
  scope :is_coaching, -> (is_coaching) { where(is_coaching: true) if is_coaching.present? && is_coaching == 1 }
  scope :is_coached, -> (is_coached) { where(is_coached: true) if is_coached.present? && is_coached == 1 }
  scope :is_clash, -> (is_clash) { where(is_clash: true) if is_clash.present? && is_clash == 1 }
  scope :good_at_top, -> (good_at_top) { where(good_at_top: true) if good_at_top.present? && good_at_top == 1 }
  scope :good_at_jg, -> (good_at_jg) { where(good_at_jg: true) if good_at_jg.present? && good_at_jg == 1 }
  scope :good_at_mid, -> (good_at_mid) { where(good_at_mid: true) if good_at_mid.present? && good_at_mid == 1 }
  scope :good_at_adc, -> (good_at_adc) { where(good_at_adc: true) if good_at_adc.present? && good_at_adc == 1 }
  scope :good_at_sup, -> (good_at_sup) { where(good_at_sup: true) if good_at_sup.present? && good_at_sup == 1 }
  scope :bad_at_top, -> (bad_at_top) { where(bad_at_top: true) if bad_at_top.present? && bad_at_top == 1 }
  scope :bad_at_jg, -> (bad_at_jg) { where(bad_at_jg: true) if bad_at_jg.present? && bad_at_jg == 1 }
  scope :bad_at_mid, -> (bad_at_mid) { where(bad_at_mid: true) if bad_at_mid.present? && bad_at_mid == 1 }
  scope :bad_at_adc, -> (bad_at_adc) { where(bad_at_adc: true) if bad_at_adc.present? && bad_at_adc == 1 }
  scope :bad_at_sup, -> (bad_at_sup) { where(bad_at_sup: true) if bad_at_sup.present? && bad_at_sup == 1 }
  scope :vc_status, -> (vc_status) { where(vc_status: vc_status) if vc_status.present? }
  scope :vc_discord, -> (vc_discord) { where(vc_discord: true) if vc_discord.present? && vc_discord == 1 }
  scope :vc_skype, -> (vc_skype) { where(vc_skype: true) if vc_skype.present? && vc_skype == 1 }
  scope :vc_leaguevoice, -> (vc_leaguevoice) { where(vc_leaguevoice: true) if vc_leaguevoice.present? && vc_leaguevoice == 1 }
  scope :sort_status, -> (sort_status) { order(updated_at: :desc) if sort_status.present? && sort_status == "desc" }

end
