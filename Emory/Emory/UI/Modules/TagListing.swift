//
//  TagListing.swift
//  Emory
//
//  Created by 鶴見駿 on 2024/11/28.
//

import SwiftUI

struct FlowLayout: Layout {
    var alignment: Alignment = .center
    var spacing: CGFloat?

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) -> CGSize {
        
        // FlowResultのイニシャライザ呼び出しの時点で動的にsubviewを挿入するのに必要な情報が作成済み
        let result = FlowResult(
            in: proposal.replacingUnspecifiedDimensions().width,
            subviews: subviews,
            alignment: alignment,
            spacing: spacing
        )
        return result.bounds // layoutのCGSizeをreturn
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout Void) {
        let result = FlowResult(
            in: proposal.replacingUnspecifiedDimensions().width,
            subviews: subviews,
            alignment: alignment,
            spacing: spacing
        )
        for row in result.rows {
            let rowXOffset = (bounds.width - row.frame.width) * alignment.horizontal.percent // alignmentの値に応じてLayoutの左端からの幅を導出
            for index in row.range {
                
                // rowの左端からのオフセット、Row内でのsubviewのRow左端からのオフセット、Layout左端のキャンパスの左端からのオフセットを足す
                let xPos = rowXOffset + row.frame.minX + row.xOffsets[index - row.range.lowerBound] + bounds.minX // XOffsetの導出ではRangeとした場合のrowの下限を現在のsubviewのindexから引く
                
                // 行内でのsubviewのalignmentを設定
                let rowYAlignment = (row.frame.height - subviews[index].sizeThatFits(.unspecified).height) *
                alignment.vertical.percent
                let yPos = row.frame.minY + rowYAlignment + bounds.minY // 行の上部のheight(bounds.minYが基準)、行内でのsubviewのalignment、layout全体のheightの和
                subviews[index].place(at: CGPoint(x: xPos, y: yPos), anchor: .topLeading, proposal: .unspecified) // (width: x, height: y)を左上に基準としてsubviewをplaceする
            }
        }
    }

    struct FlowResult {
        var bounds = CGSize.zero // Layout全体のサイズ
        var rows = [Row]() // 各行の情報を格納するCollection

        struct Row {
            var range: Range<Int> // subviewのインデックス範囲
            var xOffsets: [Double] // x方向の左端からの距離
            var frame: CGRect // 行全体のwidthとheightの情報
        }

        init(in maxPossibleWidth: Double, subviews: Subviews, alignment: Alignment, spacing: CGFloat?) {
            var itemsInRow = 0 // 最初のviewはインデックスが0のRowにある
            var remainingWidth = maxPossibleWidth.isFinite ? maxPossibleWidth : .greatestFiniteMagnitude // Row内の残りの幅を初期化。通常は横幅が無限でない場合は横の最大幅で初期化
            var rowMinY = 0.0
            var rowHeight = 0.0 // rowの高さ
            var xOffsets: [Double] = [] // row内のsubviewのxoffsetを入れる配列
            
            // subviewをそれぞれrowに格納する処理をする
            for (index, subview) in zip(subviews.indices, subviews) {
                let idealSize = subview.sizeThatFits(.unspecified)
                
                // 最初のsubviewでない、かつRowの残り幅をsubviewが超過する場合に次のRowに移動する
                if index != 0 && widthInRow(index: index, idealWidth: idealSize.width) > remainingWidth {
                    finalizeRow(index: max(index - 1, 0), idealSize: idealSize)
                }
                addToRow(index: index, idealSize: idealSize) // Rowに挿入、subviewのindexとそのサイズを情報として追加

                // 最後のsubviewの挿入後にfinalizeRow
                if index == subviews.count - 1 {
                    finalizeRow(index: index, idealSize: idealSize)
                }
            }

            // 一つ前のsubviewとのspacingを測る
            func spacingBefore(index: Int) -> Double {
                guard itemsInRow > 0 else { return 0 } // Rowの先頭であれば早期return
                
                // nil結合演算子で、spacingか、spacingがnilの場合に一つ前のsubviewとの間のspacingを返す
                return spacing ?? subviews[index - 1].spacing.distance(to: subviews[index].spacing, along: .horizontal)
            }

            // subviewを挿入した後の左端からのspacingをreturn
            func widthInRow(index: Int, idealWidth: Double) -> Double {
                idealWidth + spacingBefore(index: index)
            }

            func addToRow(index: Int, idealSize: CGSize) {
                let width = widthInRow(index: index, idealWidth: idealSize.width)

                xOffsets.append(maxPossibleWidth - remainingWidth + spacingBefore(index: index)) // rowに挿入するsubviewのxoffsetを配列に追加
                remainingWidth -= width // rowの残り幅を更新
                rowHeight = max(rowHeight, idealSize.height) // rowのCGSizeの高さを更新
                itemsInRow += 1 // row内のsubviewのカウントを追加
            }

            
            func finalizeRow(index: Int, idealSize: CGSize) {
                let rowWidth = maxPossibleWidth - remainingWidth // 挿入していったsubviewの最後尾のspacing
                
                // Rowの情報をrowに格納
                rows.append(
                    Row(
                        range: index - max(itemsInRow - 1, 0) ..< index + 1, // 挿入したsubviewのsubviews内でのindex
                        xOffsets: xOffsets,
                        frame: CGRect(x: 0, y: rowMinY, width: rowWidth, height: rowHeight) // Rowのサイズ情報
                    )
                )
                bounds.width = max(bounds.width, rowWidth) // Layoutのwidthを更新
                let ySpacing = spacing ?? ViewSpacing().distance(to: ViewSpacing(), along: .vertical)
                bounds.height += rowHeight + (rows.count > 1 ? ySpacing : 0) // Layoutのheightを更新
                rowMinY += rowHeight + ySpacing
                
                // 以下で動的にsubviewを挿入するのに必要な変数を初期化s
                itemsInRow = 0
                rowHeight = 0
                xOffsets.removeAll()
                remainingWidth = maxPossibleWidth
            }
        }
    }
}

private extension HorizontalAlignment {
    var percent: Double {
        switch self {
        case .leading: return 0
        case .trailing: return 1
        default: return 0.5
        }
    }
}

private extension VerticalAlignment {
    var percent: Double {
        switch self {
        case .top: return 0
        case .bottom: return 1
        default: return 0.5
        }
    }
}

struct TagListing: View {
    let tagList: [String]
    var body: some View {
        FlowLayout(alignment: .leading, spacing: 5) {
            ForEach(tagList, id: \.self) { tag in
                TagSegment(tagName: tag)
            }
        }
    }
}


#Preview {
    TagListing(tagList: Post.getExamplePostObject().getTags()+["情報", "工学部"])
}
