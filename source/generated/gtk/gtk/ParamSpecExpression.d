module gtk.ParamSpecExpression;

private import gobject.ParamSpec;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * A #GParamSpec for properties holding a #GtkExpression.
 */
public class ParamSpecExpression : ParamSpec
{
	/** the main Gtk struct */
	protected GtkParamSpecExpression* gtkParamSpecExpression;

	/** Get the main Gtk struct */
	public GtkParamSpecExpression* getParamSpecExpressionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkParamSpecExpression;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkParamSpecExpression;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkParamSpecExpression* gtkParamSpecExpression, bool ownedRef = false)
	{
		this.gtkParamSpecExpression = gtkParamSpecExpression;
		super(cast(GParamSpec*)gtkParamSpecExpression, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_param_expression_get_type();
	}
}
