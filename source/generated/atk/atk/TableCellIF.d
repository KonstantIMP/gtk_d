module atk.TableCellIF;

private import atk.ObjectAtk;
private import atk.c.functions;
public  import atk.c.types;
private import glib.PtrArray;
private import gobject.ObjectG;


/**
 * Being #AtkTable a component which present elements ordered via rows
 * and columns, an #AtkTableCell is the interface which each of those
 * elements, so "cells" should implement.
 * 
 * See also #AtkTable.
 */
public interface TableCellIF{
	/** Get the main Gtk struct */
	public AtkTableCell* getTableCellStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return atk_table_cell_get_type();
	}

	/**
	 * Returns the column headers as an array of cell accessibles.
	 *
	 * Returns: a GPtrArray of AtkObjects
	 *     representing the column header cells.
	 *
	 * Since: 2.12
	 */
	public PtrArray getColumnHeaderCells();

	/**
	 * Returns the number of columns occupied by this cell accessible.
	 *
	 * Returns: a gint representing the number of columns occupied by this cell,
	 *     or 0 if the cell does not implement this method.
	 *
	 * Since: 2.12
	 */
	public int getColumnSpan();

	/**
	 * Retrieves the tabular position of this cell.
	 *
	 * Params:
	 *     row = the row of the given cell.
	 *     column = the column of the given cell.
	 *
	 * Returns: TRUE if successful; FALSE otherwise.
	 *
	 * Since: 2.12
	 */
	public bool getPosition(out int row, out int column);

	/**
	 * Gets the row and column indexes and span of this cell accessible.
	 *
	 * Note: If the object does not implement this function, then, by default, atk
	 * will implement this function by calling get_row_span and get_column_span
	 * on the object.
	 *
	 * Params:
	 *     row = the row index of the given cell.
	 *     column = the column index of the given cell.
	 *     rowSpan = the number of rows occupied by this cell.
	 *     columnSpan = the number of columns occupied by this cell.
	 *
	 * Returns: TRUE if successful; FALSE otherwise.
	 *
	 * Since: 2.12
	 */
	public bool getRowColumnSpan(out int row, out int column, out int rowSpan, out int columnSpan);

	/**
	 * Returns the row headers as an array of cell accessibles.
	 *
	 * Returns: a GPtrArray of AtkObjects
	 *     representing the row header cells.
	 *
	 * Since: 2.12
	 */
	public PtrArray getRowHeaderCells();

	/**
	 * Returns the number of rows occupied by this cell accessible.
	 *
	 * Returns: a gint representing the number of rows occupied by this cell,
	 *     or 0 if the cell does not implement this method.
	 *
	 * Since: 2.12
	 */
	public int getRowSpan();

	/**
	 * Returns a reference to the accessible of the containing table.
	 *
	 * Returns: the atk object for the containing table.
	 *
	 * Since: 2.12
	 */
	public ObjectAtk getTable();
}
